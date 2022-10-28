class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'
  after_save :update_post_counter

  def five_most_recent_posts
    Comment.limit(5).order(created_at: :desc).where(post: self)
  end

  private

  def update_post_counter
    author.increment!(:postscounter)
  end
end
