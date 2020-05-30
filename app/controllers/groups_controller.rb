class GroupsController < ApplicationController
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

  private
  def group_params
    params.require(:group).permit(:name).merge(company_id: current_company.id)
  end
end
