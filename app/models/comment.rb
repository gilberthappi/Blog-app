class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :comments_counter_update

  def comments_counter_update
    post.update(comments_counter: post.comments.count)
  end
end
