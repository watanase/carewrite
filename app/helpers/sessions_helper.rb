module SessionsHelper
  def log_in(company)
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

  def logged_in?
    !current_company.nil?
  end

  def log_out
    session.delete(:company_id)
    @current_company = nil
  end
end
