class PostsController < ApplicationController
  before_action :select_user

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(@user)
    else
      rednder :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy

  end

  private
  def select_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post
    ).permit(:focus, :content, :datetime,
    ).merge(user_id: params[:user_id], recorder_id: current_recorder.id)
  end



end
