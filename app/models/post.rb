class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
