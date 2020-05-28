class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include SessionsHelper

  private
  def logged_in_company
    unless logged_in_company? && current_company?(@company)
      redirect_to login_company_path
    end
  end

  def logged_in_user
    unless logged_in_user? && current_user?(@user)
      redirect_to login_user_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
