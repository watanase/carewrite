class UsersController < ApplicationController
  def create
    binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to company_path(current_company)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name).merge(company_id: current_company.id)
  end
end
