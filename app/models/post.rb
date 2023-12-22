class Post < ApplicationRecord
  after_create :update_user_posts_counter
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_user_posts_counter

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_counter
    author.update_posts_counter
  end

  def update_likes_counter
    update_column(:likes_counter, likes.count)
  end
end
