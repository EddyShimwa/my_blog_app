require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  subject { User.new(name: 'Morrel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Bio', postsCounter: 4) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be valid' do
    subject.name = 'Morrel'
    expect(subject).to be_valid
  end

  it 'posts_counter should be valid' do
    subject.postsCounter = 10
    expect(subject).to be_valid
  end

  it 'posts_counter should not be valid' do
    subject.postsCounter = 'g'
    expect(subject).to_not be_valid
  end

  it 'should display last 3 posts' do
    subject.postsCounter = 5
    expect(subject.recent_posts).to eq(subject.posts.last(3))
  end

  it 'Displayed the last 3 posts' do
    subject.postsCounter = 4
    expect(subject.postsCounter).to eql(4)
  end
end
