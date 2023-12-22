module FakerData
  def fetch_data
    @user1 = User.includes(:posts).create(name: 'User 1', photo_url: 'https://user1.jpg', bio: 'Bio 1')
    @user2 = User.includes(:posts).create(name: 'User 2', photo_url: 'https://user2.jpg', bio: 'Bio 2')
    @user3 = User.includes(:posts).create(name: 'User 3', photo_url: 'https://user3.jpg', bio: 'Bio 3')
    @user4 = User.includes(:posts).create(name: 'User 4', photo_url: 'https://user4.jpg', bio: 'Bio 4')

    # Create posts for each user
    @user1.posts.create(title: 'My Post number 1', text: 'Post user 1')
    @user2.posts.create(title: 'My Post number 2', text: 'Post user 2')
    @user3.posts.create(title: 'My Post number 3', text: 'Post user 3')
    @user4.posts.create(title: 'My Post number 4', text: 'Post user 4')
  end
end
