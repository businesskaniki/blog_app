RSpec.describe User, type: :model do
  subject { User.new(name: 'Winkler') }

  it 'should allow a name with at least one character' do
    expect(subject).to be_valid
  end

  it 'should not allow empty name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postscounter should be bigger or equal than 0' do
    expect(subject.postscounter).to be >= 0
  end

  context '#most_recent_posts' do
    it 'most_recent_posts should return at most three items' do
      expect(subject.most_recent_posts.length).to be_between(0, 3)
    end
  end
end
