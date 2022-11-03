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
    before(:example) { get posts_path }
    it 'response code 200' do
      expect(response).to have_http_status(200)
    end

    it 'user list view' do
      expect(response).to render_template(:index)
    end

    it 'correct view content' do
      expect(response.body).to include('show all  posts here')
    end
  end

  describe 'GET /show' do
    @user = User.new(name: 'nick', photo: 'https://photo', bio: 'hey there am nick.',
                     postscounter: 0)
    @post = Post.create(author_id: @user, title: 'title 1', text: 'first post', likescounter: 0,
                        commentscounter: 0)
    @user.save
    @post.save
    @user.id
    before(:example) { get posts_path }
    it 'responds code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
