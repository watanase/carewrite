class SessionsController < ApplicationController
  before_action :move_to_root, only: %i[new_company  create_company new_user create_user]

  ## companyメソッド
  def new_company; end

  def create_company
    company = Company.find_by(name: params[:name])
    if company&.authenticate(params[:password])
      log_in_company(company)
      redirect_to company_path(company)
    else
      render :new_company
    end
  end

  def destroy_company
    log_out_company if logged_in_company?
    redirect_to root_path
  end

  # #recorderメソッド
  def new_recorder
    @company = current_company
    @group = Group.new
  end

  def create_recorder
    recorder = Recorder.find_by(login_id: params[:login_id])
    if recorder&.authenticate(params[:password])
      log_in_recorder(recorder)
      redirect_to company_path(current_company)
    else
      render :new_recorder
    end
  end

  def destroy_recorder
    log_out_recorder if logged_in_recorder?
    redirect_to company_path(current_company)
  end

  # #userメソッド
  def new_user; end

  def create_user
    user = User.find_by(login_id: params[:login_id])
    if user &.authenticate(params[:password])
      log_in_user(user)
      redirect_to family_see_user_path(user), notice: 'ログインしました'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new_user
    end
  end

  def destroy_user
    log_out_user if logged_in_user?
    redirect_to root_path
  end
end
