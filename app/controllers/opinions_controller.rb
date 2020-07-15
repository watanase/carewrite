class OpinionsController < ApplicationController
  before_action :company_select, only:[:new, :create]

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
  def company_select
    @company = Company.find_by(id: current_user.company_id)
  end

  def opinion_params
    params.require(:opinion).permit(:name, :content).merge(company_id: params[:company_id])
  end
end
