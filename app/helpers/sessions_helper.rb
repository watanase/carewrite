module SessionsHelper
  ## companyメソッド
  # 渡されたカンパニーでログインする
  def log_in_company(company)
    session[:company_id] = company.id
  end
  # 現在ログイン中のカンパニーを返す
  def current_company
    if session[:company_id]
      @current_company ||= Company.find_by(id: session[:company_id])
    end
  end
  #受け取ったカンパニーがログイン中のカンパニーと一致すればtrueを返す
  def current_company?(company)
    company == current_company
  end
  # カンパニーにログインしていればtrue、その他ならfalseを返す
  def logged_in_company?
    !current_company.nil?
  end
  # 現在のカンパニーをログアウトする
  def log_out_company
    session.delete(:company_id)
    @current_company = nil
  end

  ## userメソッド
  # 渡されたユーザーでログインする
  def log_in_user(user)
    session[:user_id] = user.id
  end
  # 現在ログイン中のユーザーを返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  #受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
  def current_user?(user)
    user == current_user
  end
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in_user?
    !current_user.nil?
  end
  # 現在のユーザーをログアウトする
  def log_out_user
    session.delete(:user_id)
    @current_user = nil
  end

end
