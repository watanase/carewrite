class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :select_company, only: %i[new create]
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
  end

  def set_user
    @user = User.find(params[:id])
  end

  def select_company
    @company = Company.find_by(id: current_company.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :hurigana, :gender, :birthday, :street_address, :image, :care_required, :status, :password, :password_confirmation, :group_id).merge(company_id: current_company.id)
  end
end
