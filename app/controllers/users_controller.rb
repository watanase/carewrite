class UsersController < ApplicationController
  before_action :company_check, only: %i[new create]
  before_action :set_user, only: %i[show]
  before_action :select_company, only: %i[new create]
  before_action :move_to_index, only: %i[show]

  def new
    @user = User.new
    @user.families.new
  end

  def create
    # binding.pry
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def select_company
    @company = Company.find_by(id: current_company.id)
  end

  def user_params
    params.require(:user).permit(
      :name,
      :hurigana,
      :gender,
      :birthday,
      :zipcode,
      :street_address,
      :image,
      :care_required,
      :status,
      :password,
      :password_confirmation,
      :group_id,
      families_attributes: %i[name hurigana phone zipcode street_address relationship information]
    ).merge(company_id: current_company.id)
  end

  def company_check
    redirect_to login_company_path unless logged_in_company?
  end
end
