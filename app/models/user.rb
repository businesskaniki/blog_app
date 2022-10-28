class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts

  def most_recent_posts
    Post.limit(3).order(created_at: :desc).where(author: self)
  end
end
