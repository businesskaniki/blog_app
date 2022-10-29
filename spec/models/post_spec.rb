RSpec.describe Post, type: :model do
  subject { Post.create(title: 'init post', author: User.new(name: 'nick')) }

  it 'the title should not be empty' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'the title should not exceed 250 characters' do
    expect(subject).to be_valid
    new_title = ''
    251.times do
      new_title.concat('T')
    end
    subject.title = new_title
    expect(subject).to_not be_valid
  end

  it 'commentscounter should be greater than zero' do
    expect(subject.commentscounter).to be >= 0
  end

  it 'likescounter should be grater than zero' do
    expect(subject.likescounter).to be >= 0
  end

  it 'postscounter should increamet by one every time a post is created' do
    expect(subject.author.postscounter).to be 1
    Post.create(title: 'My second post', author: subject.author)
    expect(subject.author.postscounter).to be 2
  end

  context '#five_most_recent_posts' do
    it 'should return at most 5 items' do
      expect(subject.five_most_recent_posts.length).to be_between(0, 5)
    end
  end
end
