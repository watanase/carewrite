class FamiliesController < ApplicationController
  def create
    @family = Family.create(family_params)
    redirect_to user_path(params[:user_id])
  end

  private

  def family_params
    params.require(:family).permit(
      :name, :hurigana, :phone, :zipcode, :street_address, :relationship, :information
    ).merge(user_id: params[:user_id])
  end
end
