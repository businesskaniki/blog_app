require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    @user = User.new(name: 'nick', photo: 'https://photo', bio: 'hey there am nick.',
                     postscounter: 0)
    @post = Post.create(author_id: @user, title: 'title 1', text: 'first post', likescounter: 0,
                        commentscounter: 0)
    @user.save
    @post.save
    @user.id
  end

  describe 'GET /show' do
    @user = User.new(name: 'nick', photo: 'https://photo', bio: 'hey there am nick.',
                     postscounter: 0)
    @post = Post.create(author_id: @user, title: 'title 1', text: 'first post', likescounter: 0,
                        commentscounter: 0)
    @user.save
    @post.save
    @user.id
  end
end
