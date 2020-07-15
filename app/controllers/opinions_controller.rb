class OpinionsController < ApplicationController
  def new
    @opinion = Opinion.new
    @user = User.find(current_user.id)
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
  def opinion_params
    params.require(:opinion).permit(:name, :content).merge(user_id: params[:user_id])
  end
end
