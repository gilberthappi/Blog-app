class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @show_all_posts = true
    @posts = @user.posts
  end
end
