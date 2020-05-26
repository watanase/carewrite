class CompanysController < ApplicationController
  def index
  end

  def new
    @company = Company.new
  end

  def create
    # binding.pry
    @company = Company.new(company_params)
    if @company.save
      redirect_to companys_path
    else
      render :new
    end
  end

  def login
    @company = Company.find_by(name: params[:name])
    if @company && @company.authenticate(params[:password])
      session[:company_id] = @company.id
      redirect_to companys_path
    else
      render :login

    # else
    #   @error_message = "間違ってますよ"
    #   @email = params[:email]
    #   @password = params[:password]
    #   render("users/login_form")
    end
  end

  private
  def company_params
    params.permit(:name, :password, :password_confirmation)
  end
end
