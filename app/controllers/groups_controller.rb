class GroupsController < ApplicationController
  # before_action :set_group only:[:show, :edit]
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to company_path(current_company)
    else
      render :new
    end
  end

  def show
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

  # def set_group
  #   @group =  Company.groups.find(params[:id])
  # end

  def group_params
    params.require(:group).permit(:name, user_ids: []).merge(company_id: current_company.id)
  end
end
