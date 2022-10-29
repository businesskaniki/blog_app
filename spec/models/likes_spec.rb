require 'rails_helper'

RSpec.describe Comment, type: :model do
  user1 = User.create(name: 'Winkler')
  post1 = Post.create(title: 'My first post', author: user1)

  subject { Like.create! author: user1, post: post1 }

  it 'likescounter increases by  1 on saving' do
    expect(subject.post.likescounter).to be 1
  end
end
