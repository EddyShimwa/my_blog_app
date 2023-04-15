# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Travel enthusiast from California', posts_counter: 0)
second_user = User.create(name: 'Jane Smith', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Yoga instructor from India', posts_counter: 0)
third_user = User.create(name: 'Michael Johnson', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Animal lover from Australia', posts_counter: 0)
forth_user = User.create(name: 'Amanda Lee', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Dietitian from New York', posts_counter: 0)
fifth_user = User.create(name: 'Mark Brown', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Entrepreneur from London', posts_counter: 0)
sixth_user = User.create(name: 'Emily Davis', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Interior designer from Paris', posts_counter: 0)
seventh_user = User.create(name: 'David Kim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Communication expert from Seoul', posts_counter: 0)

first_post = Post.create(author: first_user, title: 'Solo', text: '10 Reasons Why Traveling Solo Can Change Your Life Forever')
second_post = Post.create(author: second_user, title: 'Meditation', text: 'The Benefits of Meditation: How It Can Improve Your Life')
third_post = Post.create(author: third_user, title: 'Rescue', text: 'Why You Should Consider Adopting a Rescue Dog Today')
forth_post = Post.create(author: forth_user, title: 'Healthy', text: 'Healthy Eating Habits: Tips for a Balanced and Nutritious Die')
fifth_post = Post.create(author: fifth_user, title: 'Online', text: 'How to Start a Successful Online Business from Scratch')
sixth_post = Post.create(author: sixth_user, title: 'Home', text: '5 Simple Home Improvement Projects to Enhance Your Living Space')
seventh_post = Post.create(author: seventh_user, title: 'Public', text: 'How to master the art of public speaking')



Comment.create(post: first_post, author: second_user, text: 'Hi this is comment 1' )
Comment.create(post: first_post, author: first_user, text: 'Hi this is comment 2' )
Comment.create(post: first_post, author: second_user, text: 'Hi this is comment 3' )
Comment.create(post: first_post, author: forth_user, text: 'Hi this is comment 4' )
Comment.create(post: first_post, author: fifth_user, text: 'Hi this is comment 5' )
Comment.create(post: first_post, author: sixth_user, text: 'Hi this is comment 6' )
Comment.create(post: first_post, author: seventh_user, text: 'Hi this is comment 7' )