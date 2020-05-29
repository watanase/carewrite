class RecordersController < ApplicationController
  def new
    @recorder = Recorder.new
  end

  def create
    # binding.pry
    @recorder = Recorder.new(recorder_params)
    if @recorder.save
      redirect_to company_path(current_company)
    else
      render :new
    end
  end

  private
  def recorder_params
    params.require(:recorder).permit(:name, :password, :password_confirmation).merge(companies_id: current_company.id)
  end
end
