class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :like
  has_many :comment

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    user_id.update(posts_counter: author.posts.count)
  end

  def last_comments
    comments.includes(:post_id).order(created_at: :ASC).limit(5)
  end
end
