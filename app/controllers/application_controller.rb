class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include SessionsHelper

  private
  # ログイン済みカンパニーかどうか確認
  def logged_in_company
    unless logged_in_company? && current_company?(@company)
      redirect_to login_company_path
    end
  end
  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in_user? && current_user?(@user)
      redirect_to login_user_path
    end
  end
  # ログイン済みユーザーまたはユーザーに紐づくカンパニーにログインしているかどうか確認
  def move_to_index
    if logged_in_company?
      redirect_to login_user_path unless current_company.id == @user.companies_id
    else logged_in_user
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
