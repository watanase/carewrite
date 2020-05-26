class SessionsController < ApplicationController
  def new
  end

  def create
    @company = Company.find_by(name: params[:name])
    if @company && @company.authenticate(params[:password])
      session[:company_id] = @company.id
      redirect_to companys_path(@company)
    else
      redirect_to :root

    # else
    #   @error_message = "間違ってますよ"
    #   @email = params[:email]
    #   @password = params[:password]
    #   render("users/login_form")
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
