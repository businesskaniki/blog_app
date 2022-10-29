Post require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'John Doe',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )

    @post = Post.create(
      title: 'Hello World!',
      text: 'This is my first post.',
      comments_counter: 0,
      likes_counter: 0,
      author_id: @user.id
    )
  end
  it '@post should be valid' do
    expect(@post).to be_valid
  end
  it '@post should have 250 maximum length' do
    @post.title = 'Helo World!'
    expect(@post).to be_valid
  end
  it '@post comments_counter to be an integer greater than or equal to 0' do
    @post.comments_counter = 'one'
    expect(@post).to_not be_valid
  end
  it '@post likes_counter to be an integer greater than or equal to 0' do
    @post.likes_counter = 'one'
    expect(@post).to_not be_valid
  end
end
