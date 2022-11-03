class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts

  validates :name, presence: true
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_posts
    Post.limit(3).order(created_at: :desc).where(author: self)
  end
end
