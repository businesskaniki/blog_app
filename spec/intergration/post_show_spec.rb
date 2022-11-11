require 'rails_helper'

RSpec.describe 'Posts Page', type: :view do
  describe 'pposts#show page' do
    before(:each) do
      @user1 = User.create(name: 'Sharon',
                           photo: "https://images.unsplash.com/photo-1667255949472-2f8bba82deb1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80\n  ",
                           bio: 'oooooooo',
                           postscounter: 10)
      @post1 = Post.create(
        title: 'Post 1',
        text: 'This is my first post',
        commentscounter: 14,
        likescounter: 6,
        author_id: @user1.id
      )
      @comment = Comment.create(post: @post1, author: @user1, text: 'Hi Tom!')
      visit user_post_path(@user1, @post1)
    end
    it 'shows the right title of the post' do
      expect(page).to have_content(@post1.title)
    end
    it 'shows the right username of who added the post' do
      expect(page).to have_content(@post1.author.name)
    end
    it 'shows the right number of comments in a post' do
      expect(page).to have_content(@post1.commentscounter)
    end
    it 'shows the right number of likes in a post' do
      expect(page).to have_content(@post1.likescounter)
    end
    it 'shows the right body of the post' do
      expect(page).to have_content(@post1.text)
    end
    it 'shows the right username of a commentor' do
      expect(page).to have_content(@comment.author.name)
    end
    it 'shows the right comment by a commentor' do
      expect(page).to have_content(@comment.text)
    end
  end
end
