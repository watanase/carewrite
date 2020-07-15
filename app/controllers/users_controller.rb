class UsersController < ApplicationController
  before_action :company_check, only: %i[new create edit update]
  before_action :set_user, only: %i[show edit update move_out archives family_archives family_see destroy]
  before_action :select_company, only: %i[new create edit update show archives]
  before_action :move_to_index, only: %i[show]
  before_action :search
  require 'will_paginate/array'

  def index
    @company = Company.find_by(id: current_user.company_id) if logged_in_user?
  end

  def new
    @user = User.new
    @users = User.where(company_id: current_company.id)
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @family = Family.new
    @families = @user.families.all
  end

  def edit
    @users = User.where(company_id: current_company.id)
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def move_out
    @user.update(status: 2, group_id: nil)
    redirect_to user_path(@user)
  end

  def archives
    @archives = @user.devide_monthly
    @yyyymm = params[:yyyymm]
    @posts = @user.posts.group_by { |post| post.datetime.strftime('%Y%m')[@yyyymm] }[params[:yyyymm]].paginate(
      page: params[:page], per_page: 25
    )
  end

  def family_archives
    @archives = @user.devide_monthly
    @yyyymm = params[:yyyymm]
    @posts = @user.posts.group_by { |post| post.datetime.strftime('%Y%m')[@yyyymm] }[params[:yyyymm]].paginate(
      page: params[:page], per_page: 25
    )
  end

  def destroy
    @user.destroy
    redirect_to company_path(current_company)
  end

  def search
    @search = Post.ransack(params[:q])
    @posts = @search.result.paginate(
      page: params[:page], per_page: 25
    ).where(user_id: @user)
  end

  def family_see
    @families = @user.families.all
    @company = Company.find_by(id: current_user.company_id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def select_company
    @company = Company.find_by(id: current_company.id) if logged_in_company?
  end

  def user_params
    params.require(:user).permit(
      :name,        :furigana,
      :gender,      :birthday,
      :zipcode,     :street_address,
      :image,       :care_required,
      :status,      :occupancy,
      :room_number, :login_id,
      :password,    :password_confirmation,
      :group_id
    ).merge(company_id: current_company.id)
  end

  def company_check
    redirect_to login_company_path unless logged_in_company?
  end
end
