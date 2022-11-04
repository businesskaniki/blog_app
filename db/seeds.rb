# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
third_user = User.create(name: 'nick', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
fourth_user = User.create(name: 'mike', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is hello')
second_post = Post.create(author: second_user, title: 'Hey', text: 'This is my first post sayimg hey')
third_post = Post.create(author: first_user, title: 'world', text: 'This is my first pos about the worldt')
fouth_post = Post.create(author: fourth_user, title: 'Africa', text: 'This is my african post')



Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: second_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: second_post, author: first_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: fourth_user, text: 'Hi Tom!' )
Comment.create(post: fourth_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: third_post, author: second_user, text: 'Hi Tom!' )