module SessionsHelper
  def log_in_company(company)
    session[:company_id] = company.id
  end

  def current_company
    if session[:company_id]
      @current_company ||= Company.find_by(id: session[:company_id])
    end
  end

  def current_company?(company)
    company == current_company
  end

  def logged_in_company?
    !current_company.nil?
  end

  def log_out_company
    session.delete(:company_id)
    @current_company = nil
  end

  def log_in_user(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in_user?
    !current_user.nil?
  end

  def log_out_user
    session.delete(:user_id)
    @current_user = nil
  end
end
