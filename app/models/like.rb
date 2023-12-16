class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :likes_counter_update

  def likes_counter_update
    post.update(likes_counter: post.likes.count)
  end
end
