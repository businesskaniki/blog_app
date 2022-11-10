require 'rails_helper'

RSpec.describe 'Users index', type: :system do
  describe 'users#index page' do
    before(:each) do
      @user1 = User.create(name: 'Sharon',
                           photo: 'https://images.unsplash.com/photo-1667857481501-b447de8ed0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60',
                           bio: 'Teacher from Kenya')
      @user2 = User.create(name: 'Tom',
                           photo: 'https://images.unsplash.com/photo-1667857481501-b447de8ed0c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60',
                           bio: 'Teacher from Mexico')
      visit users_path
    end
    it 'shows the right user profile picture' do
      expect(page).to have_css("img[src='#{@user1.photo}']")
      expect(page).to have_css("img[src='#{@user2.photo}']")
    end
    it 'shows the right user name' do
      expect(page).to have_content(@user1.postscounter)
      expect(page).to have_content(@user2.postscounter)
    end
    it 'shows the right number of posts written by a user' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end
    it 'redirects the user to the right user information' do
      expect(page).to have_link(@user1.name, href: user_path(@user1.id))
    end
  end
end