class CompaniesController < ApplicationController
  before_action :move_to_root, only: %i[index new]
  before_action :set_company, only: %i[show edit]
  before_action :logged_in_company, only: %i[show edit]

  def index; end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      log_in_company @company
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @q = User.where(
      company_id: current_company.id, status: [0, 1]
    ).ransack(params[:q])
    @users = @q.result(distinct: true)
    @move_out_users = User.where(company_id: current_company.id, status: [2])
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to company_path(current_company)
    else
      render :edit
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :password, :password_confirmation)
  end
end
