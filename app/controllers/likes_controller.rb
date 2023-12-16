class LikesController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    Rails.logger.debug("Params: #{params.inspect}")
    @user = User.find(params[:user_id])
    @like = @user.likes.new(post: @post)

    begin
      ActiveRecord::Base.transaction do
        @like.save!

        @post.likes_counter ||= 0

        @post.likes_counter = @post.likes.count

        @post.save!
      end

      redirect_to user_post_path(@user, @post), notice: 'Post was successfully liked'
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Error creating like: #{e.message}")
      redirect_to user_post_path(@user, @post), alert:
      'Unable to create like.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
