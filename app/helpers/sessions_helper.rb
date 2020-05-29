module SessionsHelper
  ## companyメソッド
  # 渡されたcompanyでログインする
  def log_in_company(company)
    session[:company_id] = company.id
  end
  # 現在ログイン中のcompanyを返す
  def current_company
    if session[:company_id]
      @current_company ||= Company.find_by(id: session[:company_id])
    end
  end
  #受け取ったcompanyがログイン中のcompanyと一致すればtrueを返す
  def current_company?(company)
    company == current_company
  end
  # companyにログインしていればtrue、その他ならfalseを返す
  def logged_in_company?
    !current_company.nil?
  end
  # 現在のcompanyをログアウトする
  def log_out_company
    session.delete(:company_id)
    @current_company = nil
  end

  ## recoderメソッド
  # 渡されたuserでログインする
  def log_in_recoder(recoder)
    session[:user_id] = user.id
  end
  # 現在ログイン中のrecoderを返す
  def current_recoder
    if session[:recoder_id]
      @current_recoder ||= Recoder.find_by(id: session[:recoder_id])
    end
  end
  #受け取ったrecoderがログイン中のrecoderと一致すればtrueを返す
  def current_recoder?(recoder)
    recoder == current_recoder
  end
  # recoderがログインしていればtrue、その他ならfalseを返す
  def logged_in_recoder?
    !current_recoder.nil?
  end
  # 現在のrecoderをログアウトする
  def log_out_recoder
    session.delete(:recoder_id)
    @current_recoder = nil
  end

  ## userメソッド
  # 渡されたuserでログインする
  def log_in_user(user)
    session[:user_id] = user.id
  end
  # 現在ログイン中のuserを返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  #受け取ったuserがログイン中のuserと一致すればtrueを返す
  def current_user?(user)
    user == current_user
  end
  # userがログインしていればtrue、その他ならfalseを返す
  def logged_in_user?
    !current_user.nil?
  end
  # 現在のuserをログアウトする
  def log_out_user
    session.delete(:user_id)
    @current_user = nil
  end

end
