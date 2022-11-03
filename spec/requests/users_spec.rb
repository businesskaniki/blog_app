require 'rails_helper'

RSpec.describe 'users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path }
    it 'expects code 200' do
      expect(response).to have_http_status(200)
    end

    it 'renders authors list view' do
      expect(response).to render_template(:index)
    end

    it 'correct view content' do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'GET /show' do
    @user = User.new(name: 'nick', photo: 'https://photo', bio: 'hey there am  nick.',
                     postscounter: 0)
    @user.save
    id = @user.id
    before(:example) { get users_path(id) }
    it 'expect code 200' do
      expect(response).to have_http_status(200)
    end

    it 'correct view' do
      expect(response.body).to include('Here is a list of all users')
    end
  end
end
