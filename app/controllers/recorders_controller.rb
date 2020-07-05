class RecordersController < ApplicationController

  def index
    @recorders = Recorder.where(company_id: current_company.id)
  end

  def new
    @recorder = Recorder.new
    @company = Company.find(current_company.id)
    @group = Group.new
    @users = User.where(company_id: current_company.id)
  end

  def create
    # binding.pry
    @recorder = Recorder.create(recorder_params)
    if @recorder.save
      redirect_to company_path(current_company)
    else
      @company = Company.find(current_company.id)
      render :new
    end
  end

  private
  def recorder_params
    params.require(:recorder).permit(:name, :login_id, :password, :password_confirmation).merge(company_id: current_company.id)
  end
end
