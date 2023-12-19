class CommentsController < ApplicationController
  before_action :set_post, except: [:new]

  def new
    @comment = Comment.new
  end

  def create
    @comment =
      @post.comments.build(comment_params.merge(user:
      @current_user))

    if @comment.save
      redirect_to user_post_path(@post.author, @post),
                  notice: 'Comment added!'
    else
      render 'posts/show', alert: 'Unable to add
            comment.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
