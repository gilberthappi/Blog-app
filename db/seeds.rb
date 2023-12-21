# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: 'Happi', photo: '../app/assets/images/sandy.jpg', bio: 'Sodier from Russia.')
User.create(name: 'Bill', photo: '../app/assets/images/patrick.jpg', bio: 'Musician from China.')
User.create(name: 'Tom', photo: '../app/assets/images/patrick.jpg', bio: 'Teacher from Burundi')
User.create(name: 'Jerry', photo: '../app/assets/images/sandy.jpg', bio: 'Teacher from Rwanda.')


Post.create(author_id: 1, title: 'Hello', text: 'This is my first post')
Post.create(author_id: 2, title: 'Hello World', text: 'This is my second post')
Post.create(author_id: 1, title: 'Hello', text: 'This is my Third post')
Post.create(author_id: 1, title: 'Hello', text: 'This is my fourth post')

Comment.create(post_id: 1, author_id: 1, text: 'Hi Tom!' )
Comment.create(post_id: 2, author_id: 2, text: 'Hi Tom!')
Comment.create(post_id: 2, author_id: 2, text: 'Hi Tobin!')
Comment.create(post_id: 2, author_id: 2, text: 'Hi Microverse')
Comment.create(post_id: 2, author_id: 2, text: 'Hi Student success')
Comment.create(post_id: 2, author_id: 2, text: 'Hello Rails')
