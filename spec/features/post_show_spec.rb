require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  let(:user) { User.create(name: 'Fatema', photo_url: 'https://photos.jpg', bio: 'This is my bio', posts_counter: 1) }
  let!(:post) { Post.create(title: 'Post 1', text: 'test text', author_id: user.id, comments_counter: 2) }
  let!(:post2) { Post.create(title: 'My Post 2', text: 'test text', author_id: user.id, comments_counter: 3) }

  let!(:comment1) { Comment.create(user_id: user.id, post_id: post.id, text: 'Comment: 1') }
  let!(:comment2) { Comment.create(user_id: user.id, post_id: post.id, text: 'Comment: 2') }
  let!(:comment3) { Comment.create(user_id: user.id, post_id: post.id, text: 'Comment: 3') }

  it 'Display post\'s title' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.title)
  end

  it 'Display who wrote the post' do
    visit user_post_path(user, post)
    expect(page).to have_content(user.name.to_s)
  end

  it 'Display how many likes it has' do
    visit user_post_path(user, post)
    expect(page).to have_content("Like: #{post.likes_counter}")
  end

  it 'Display the post body' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.text)
  end

  describe 'Display the username and comment of each commentor' do
    before do
      user1 = User.create(id: 5, name: 'Fatema', posts_counter: 1, bio: 'Bio 1', photo_url: 'https://photos.jpg')
      user2 = User.create(id: 6, name: 'Nicky', posts_counter: 1, bio: 'Bio 1', photo_url: 'https://photos.jpg')
      post_ = Post.create(title: 'First post', text: 'This is my test', author_id: user1.id, comments_counter: 5,
                          likes_counter: 0)
      Comment.create(user_id: user1.id, post_id: post_.id, text: 'Comment 1')
      Comment.create(user_id: user2.id, post_id: post_.id, text: 'Comment 2')
      visit user_post_path(user1, post_)
    end
  end
end
