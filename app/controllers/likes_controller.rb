class LikesController < ApplicationController
  before_action :attr_user_post

  def new
    @like = Like.new(user: current_user, post: @post)
  end

  def create
    @current_user = current_user
    @like = Like.new(user: @current_user, post: @post)

    if @like.save!
      flash[:success] = ' Liked '
      redirect_to user_post_path(@user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attr_user_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
end
