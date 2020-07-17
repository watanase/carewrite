class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :select_company, only: %i[index new create show edit]
  before_action :logged_in_company, only: %i[index new]

  def index
    @groups = Group.where(company_id: current_company.id)
  end

  def new
    @group = Group.new
    @recorder = Recorder.new
    @users = User.where(company_id: current_company.id)
  end

  def create
    @group = Group.create(group_params)
    redirect_to company_path(@company)
  end

  def show
    @q = User.where(
      group_id: params[:id]
    ).ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to company_groups_path(current_company)
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to company_groups_path(current_company)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def select_company
    if logged_in_company?
      @company = Company.find(current_company.id)
    end
  end

  def group_params
    params.require(:group).permit(:name).merge(company_id: current_company.id)
  end
end
