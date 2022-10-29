class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'
  after_save :update_post_counter

  validates :title, presence: true
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, length: { maximum: 250 }

  def five_most_recent_posts
    Comment.limit(5).order(created_at: :desc).where(post: self)
  end

  private

  def update_post_counter
    author.increment!(:postscounter)
  end
end
