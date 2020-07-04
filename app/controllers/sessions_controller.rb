class SessionsController < ApplicationController
  ## companyメソッド
  def new_company
  end

  def create_company
    @company = Company.find_by(name: params[:name])
    if @company && @company.authenticate(params[:password])
      session[:company_id] = @company.id
      redirect_to company_path(@company)
    else
      render :new_company
    end
  end

  def destroy_company
    log_out_company if logged_in_company?
    redirect_to root_path
  end
  ##recorderメソッド
  def new_recorder
    @company = current_company
    @group = Group.new
  end

  def create_recorder
    @recorder = Recorder.find_by(login_id: params[:login_id])
    if @recorder && @recorder.authenticate(params[:password])
      session[:recorder_id] = @recorder.id
      redirect_to company_path(current_company)
    else
      render :new_recorder
    end
  end

  def destroy_recorder
    log_out_recorder if logged_in_recorder?
    redirect_to company_path(current_company)
  end
  ##userメソッド
  def new_user
  end

  def create_user
    # binding.pry
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to family_see_user_path(@user)
    else
      render :new_user
    end
  end

  def destroy_user
    log_out_user if logged_in_user?
    redirect_to root_path
  end
end
