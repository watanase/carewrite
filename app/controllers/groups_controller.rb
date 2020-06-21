class GroupsController < ApplicationController
  before_action :set_group, only:[:show, :edit]
  before_action :set_company, only: %i[create show]
  before_action :logged_in_company, only: %i[show]

  def new
    @group = Group.new
    @recorder = Recorder.new
    @company = Company.find(current_company.id)
    @users = User.where(company_id: current_company.id)
  end

  def create
    @group = Group.create(group_params)
    redirect_to company_path(@company)
  end

  def show
    @company_group = @group
    @group = Group.new
    @users = User.where(company_id: current_company.id)
  end

  def edit
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to company_path(current_company), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def set_company
    @company = Company.find(current_company.id)
  end

  def group_params
    params.require(:group).permit(:name).merge(company_id: current_company.id)
  end
end