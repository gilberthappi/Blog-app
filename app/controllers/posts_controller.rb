class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @current_user = current_user
    @posts = Post.where(author_id: @user.id)
  end

  # create a show action
  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
    @current_user = current_user
    @author = User.find(@post.author_id)
    @comments = @post.comments
    @comment = Comment.new(user: @current_user, post: @post)
  end

  def new
    @user = current_user
    @post = @user.posts.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
    puts 'created'
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)
    @post.author_id = @user.id

    puts 'User:', @user.inspect
    puts 'Post:', @post.inspect

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_post_path(@user, @post)
        else
          flash[:error] = "Post creation failed: #{@post.errors.full_messages.join(', ')}"
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
