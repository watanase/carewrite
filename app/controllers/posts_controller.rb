class PostsController < ApplicationController
  before_action :select_user
  before_action :set_post, only:[:edit, :update]


  def index
    @group = Group.new
    @posts = Post.where(user_id: @user)
    @archives = @user.devide_monthly
  end

  def new
    @company = Company.find(current_company.id)
    @post = Post.new
    @group = Group.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to user_posts_path(@user)
    else
      rednder :new
    end
  end

  def edit
    @company = Company.find(current_company.id)
    @group = Group.new
  end

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
    @posts = Post.where(user_id: @user)
    @archives = @user.devide_monthly
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def select_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post
    ).permit(:focus, :content, :datetime, :name
    ).merge(user_id: params[:user_id], recorder_id: current_recorder.id)
  end
end
