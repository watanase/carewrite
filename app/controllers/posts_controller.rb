class PostsController < ApplicationController
  before_action :select_user
  before_action :set_post, only: %i[edit update]
  before_action :move_to_index, only: %i[index new edit search family_see]
  before_action :select_company, only: %i[index new edit]
  before_action :search

  def index
    @posts = Post.where(user_id: @user).paginate(page: params[:page], per_page: 25)
    @archives = @user.devide_monthly
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to user_posts_path(@user)
    else
      rednder :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to user_posts_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
  end

  def family_see
    @posts = Post.where(user_id: @user).paginate(page: params[:page], per_page: 25)
    @archives = @user.devide_monthly
    @company = Company.find_by(id: current_user.company_id)
  end

  def search
    @search = Post.ransack(params[:q])
    @posts = @search.result.paginate(page: params[:page], per_page: 25).where(user_id: @user)
    @archives = @user.devide_monthly
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def select_user
    @user = User.find(params[:user_id])
  end

  def select_company
    @company = Company.find(current_company.id)
  end

  def post_params
    params.require(:post).permit(
      :focus,
      :content,
      :datetime,
      :name
    ).merge(user_id: params[:user_id], recorder_id: current_recorder.id)
  end
end
