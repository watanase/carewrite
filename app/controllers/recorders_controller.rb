class RecordersController < ApplicationController
  before_action :select_company, only: %i[index new]
  before_action :logged_in_company, only: %i[index new]

  def index
    @recorders = Recorder.where(company_id: current_company.id)
  end

  def new
    @recorder = Recorder.new
    @users = User.where(company_id: current_company.id)
  end

  def create
    @recorder = Recorder.create(recorder_params)
    if @recorder.save
      redirect_to company_path(current_company)
    else
      render :new
    end
  end

  def destroy
    @recorder = Recorder.find(params[:id])
    @recorder.destroy
    redirect_to company_recorders_path(current_company)
  end

  private

  def select_company
    return unless logged_in_company?

    @company = Company.find(current_company.id)
  end

  def recorder_params
    params.require(:recorder).permit(
      :name,
      :login_id,
      :password,
      :password_confirmation
    ).merge(company_id: current_company.id)
  end
end
