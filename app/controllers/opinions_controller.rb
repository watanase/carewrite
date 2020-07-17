class OpinionsController < ApplicationController
  before_action :company_select, only: %i[new]
  before_action :company_check, only: %i[index]
  before_action :logged_in_company, only: %i[index]
  before_action :select_user, only: %i[new]
  before_action :logged_in_user, only: %i[new]

  def index
    @opinions = Opinion.where(company_id: current_company.id)
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.create(opinion_params)
    if @opinion.save
      redirect_to family_see_user_path(current_user)
    else
      render :new
    end
  end

  private

  def select_user
    @user = current_user
  end

  def company_select
    if logged_in_user?
      @company = Company.find_by(id: current_user.company_id)
    end
  end

  def company_check
    if logged_in_company?
      @company = Company.find(current_company.id)
    end
  end

  def opinion_params
    params.require(:opinion).permit(:name, :content).merge(company_id: params[:company_id])
  end
end
