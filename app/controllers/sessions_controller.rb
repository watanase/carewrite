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
  ##recoderメソッド
  def new_recoder
  end

  def create_recoder
    @recoder = Recoder.find_by(name: params[:name])
    if @recoder && @recoder.authenticate(params[:password])
      session[:recoder_id] = @recoder.id
      redirect_to recoder_path(@recoder)
    else
      render :new_recoder
    end
  end

  def destroy_recoder
    log_out_recoder if logged_in_recoder?
    redirect_to root_path
  end
  ##userメソッド
  def new_user
  end

  def create_user
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to :root
    end
  end

  def destroy_user
    log_out_user if logged_in_user?
    redirect_to root_path
  end
end
