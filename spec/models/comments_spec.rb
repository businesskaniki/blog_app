require 'rails_helper'

RSpec.describe Comment, type: :model do
  user1 = User.create(name: 'nick')
  post1 = Post.create(title: 'posted', author: user1)

  subject { Comment.create(text: 'haroooo', author: user1, post: post1) }

  it 'commentcounter increament by  1 on saving the post' do
    expect(subject.post.commentscounter).to be 1
  end
end
