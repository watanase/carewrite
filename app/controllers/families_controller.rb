class FamiliesController < ApplicationController
  before_action :select_user, only: %i[new edit update destroy]
  before_action :set_family, only: %i[edit update destroy]
  before_action :move_to_index, only: %i[new edit]
  before_action :select_company, only: %i[new edit]

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(family_params)
    redirect_to user_path(params[:user_id])
  end

  def edit; end

  def update
    if @family.update(family_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @family.destroy
    redirect_to user_path(@user)
  end

  private

  def set_family
    @family = Family.find(params[:id])
  end

  def select_user
    @user = User.find(params[:user_id])
  end

  def select_company
    @company = Company.find(current_company.id)
  end

  def family_params
    params.require(:family).permit(
      :name,
      :furigana,
      :phone,
      :zipcode,
      :street_address,
      :relationship,
      :information
    ).merge(user_id: params[:user_id])
  end
end
