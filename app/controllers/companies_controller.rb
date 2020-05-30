class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show]
  before_action :logged_in_company, only: %i[show]
  before_action :set_group, only: %i[show]
  def new
    @company = Company.new
  end

  def create
    # binding.pry
    @company = Company.new(company_params)
    if @company.save
      log_in_company @company
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def set_group
    @group =  Group.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :password, :password_confirmation)
  end
end
