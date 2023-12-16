class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    @recent_posts = @user.last_three_posts
  end
end
