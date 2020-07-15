module SessionsHelper
  ## companyメソッド
  # 渡されたcompanyでログインする
  def log_in_company(company)
    session[:company_id] = company.id
  end

  # 現在ログイン中のcompanyを返す
  def current_company
    Company.find_by(id: session[:company_id]) if session[:company_id]
  end

  # 受け取ったcompanyがログイン中のcompanyと一致すればtrueを返す
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
    session.delete(:recorder_id)
  end

  ## recorderメソッド
  # 渡されたrecorderでログインする
  def log_in_recorder(recorder)
    session[:recorder_id] = recorder.id
  end

  # 現在ログイン中のrecorderを返す
  def current_recorder
    Recorder.find_by(id: session[:recorder_id]) if session[:recorder_id]
  end

  # 受け取ったrecorderがログイン中のrecorderと一致すればtrueを返す
  def current_recorder?(recorder)
    recorder == current_recorder
  end

  # recorderがログインしていればtrue、その他ならfalseを返す
  def logged_in_recorder?
    !current_recorder.nil?
  end

  # 現在のrecorderをログアウトする
  def log_out_recorder
    session.delete(:recorder_id)
  end

  ## userメソッド
  # 渡されたuserでログインする
  def log_in_user(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のuserを返す
  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # 受け取ったuserがログイン中のuserと一致すればtrueを返す
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
  end
end
