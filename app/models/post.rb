class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :posts_counter_update

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def posts_counter_update
    author.update(posts_counter: author.posts.count)
  end
end
