class PostsController < ApplicationController
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

  end

  def destroy

  end

  private
  # def select_user
  #   @user =
  # end

  def post_params
    params.require(:post
    ).permit(:focus, :content, :date
    ).merge(user_id: ugser.id)
  end



end
