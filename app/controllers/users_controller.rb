class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :user_show_permit, only: %i[show]
  def index
  end

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def set_user
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.permit(:name, :password, :password_confirmation).merge(companies_id: current_company.id)
  end
end
