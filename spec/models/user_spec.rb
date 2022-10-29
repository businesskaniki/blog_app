User require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(
      name: 'John Doe',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )
  end
  it '@user should be valid' do
    expect(@user).to be_valid
  end
  it '@user should have a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
  it 'posts_counter should be an integer' do
    @user.posts_counter = 'one'
    expect(@user).to_not be_valid
  end
  it 'posts_counter should be greater than or equal to 0' do
    @user.posts_counter = -1
    expect(@user).to_not be_valid
  end
  it 'Bio should be valid' do
    @user.bio = 'Teacher from Mexico.'
    expect(@user).to_not be_valid
  end
end
