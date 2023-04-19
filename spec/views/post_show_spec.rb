require 'rails_helper'

RSpec.describe 'posts/show', type: :feature do
    before(:each) do
        @user_1 = User.create!(
            name: 'username1',
            photo: 'Photo',
            bio: 'Text',
            posts_counter: 2
        )
        @user_2 = User.create!(
            name: 'username2',
            photo: 'Photo2',
            bio: 'Text2',
            posts_counter: 0,
        )
        @post_1 = Post.create!(
            title: 'Title1',
            text: 'Text1',
            comments_counter: 3,
            likes_counter: 1,
            author: @user_1
        )
        @post_2 = Post.create!(
            title: 'Title2',
            text: 'Text2',
            comments_counter: 0,
            likes_counter: 0,
            author: @user_1
        )
        @comment_1 = Comment.create!(
            text: 'Comment1',
            post: @post_1,
            author: @user_2
        )
        @comment_2 = Comment.create!(
            text: 'Comment2',
            post: @post_1,
            author: @user_2
        )
        @comment_3 = Comment.create!(
            text: 'Comment3',
            post: @post_1,
            author: @user_2
        )

        visit user_post_path(@user_1.id, @post_1.id)
    end 

    it 'Show the post title' do
        expect(page).to have_content('Title1')
    end

    it 'Show the post author' do
        expect(page).to have_content('username1')
    end

    it 'Show the number of comments' do
        expect(page).to have_content('3')
    end

    it 'Show the number of likes' do
        expect(page).to have_content('1')
    end

    it 'Show the post body' do 
        expect(page).to have_content('MyText1')
    end

    it 'Show the comment author' do
        expect(page).to have_content('username2')
    end

    it 'Show the comment body' do
        expect(page).to have_content('Comment1')
        expect(page).to have_content('Comment2')
        expect(page).to have_content('Comment3')
    end
end