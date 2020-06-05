class UsersController < ApplicationController
  before_action :company_check, only: %i[new create edit update]
  before_action :set_user, only: %i[show edit update]
  before_action :select_company, only: %i[new create edit update]
  before_action :move_to_index, only: %i[show]

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
    @family = Family.new
    @families = @user.families.all
  end

  def edit
  end

  def update
    if @user.update(user_paramsｚ)
      redirect_to @user
    else
      render :edit
    end
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
    ).merge(company_id: current_company.id)
  end

  def company_check
    redirect_to login_company_path unless logged_in_company?
  end
end
