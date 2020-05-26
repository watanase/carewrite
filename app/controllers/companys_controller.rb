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

  def show
  end

  private
  def company_params
    params.permit(:name, :password, :password_confirmation)
  end
end
