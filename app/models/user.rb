class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :photo_url, allow_blank: true, format: { with: %r{\Ahttps?://.*\z}, message: 'must be a valid URL' }
  validates :bio, length: { maximum: 500 }

  def three_most_recent_posts
    posts.includes(:author).order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    update(posts_counter: posts.count)
  end
end
