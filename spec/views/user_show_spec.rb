require 'rails_helper'

RSpec.describe 'user/show', type: :feature do
  before(:each) do
    @user1 = User.create!(
      name: 'username1',
      photo: 'Photo1',
      bio: 'Text1',
      posts_counter: 3
    )
    @user2 = User.create!(
      name: 'Name2',
      photo: 'Photo2',
      bio: 'Text2',
      posts_counter: 2
    )

    visit root_path

    @post1 = Post.create!(
      title: 'Title1',
      text: 'Text1',
      author: @user1,
      comments_counter: 0,
      likes_counter: 0
    )
    @post2 = Post.create!(
      title: 'Title2',
      text: 'Text2',
      author: @user1,
      comments_counter: 0,
      likes_counter: 0
    )
    @post3 = Post.create!(
      title: 'Title3',
      text: 'Text3',
      author: @user1,
      comments_counter: 0,
      likes_counter: 0
    )
    visit user_path(@user1.id)
  end

  it 'Shows the profile picture' do
    expect(page).to have_xpath("//img[@src='Photo1']")
  end

  it 'Show the users username' do
    expect(page).to have_content('username1')
  end

  it 'Show the number of posts written by the user' do
    expect(page).to have_content('3')
  end

  it 'Show the user’s bio' do
    expect(page).to have_content('Text1')
  end

  it 'show the users first 3 posts' do
    expect(page).to have_content('Title1')
    expect(page).to have_content('Title2')
    expect(page).to have_content('Title3')
  end

  it 'Show the button to see all posts written by user' do
    expect(page).to have_link('See all posts')
  end

  it "When I click on a user post, it redirects me to that post's show page" do
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@user1)
  end
  it "When I click to see all posts, it redirects me to the user's post's index page" do
    click_link 'Title1'
    expect(page).to have_current_path user_post_path(@user1, @post1)
  end
end
