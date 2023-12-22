require 'rails_helper'

RSpec.describe 'Post Index Page', type: :feature do
  let(:user) { User.create(name: 'Fatema', photo_url: 'https://photos.jpg', bio: 'This is my bio', posts_counter: 1) }

  let!(:post) { Post.create(title: 'Post 1', text: 'test text', author_id: user.id, comments_counter: 0) }
  let!(:post2) { Post.create(title: 'My Post 2', text: 'test text', author_id: user.id, comments_counter: 0) }

  let!(:comment) { Comment.create(user_id: user.id, post_id: post.id, text: 'Comment 1') }

  let!(:like) { Like.create(user_id: user.id, post_id: post.id) }

  it 'displays the user\'s profile picture' do
    visit user_posts_path(user)
    expect(page).to have_css("img.user_avatar[src*='https://photos.jpg']")
  end

  it 'displays the user\'s username' do
    visit user_posts_path(user)
    expect(page).to have_content(user.name)
  end

  it 'displays the number of posts the user has written' do
    visit user_posts_path(user)
    expect(page).to have_content(user.posts_counter)
  end

  it 'displays a post\'s title' do
    visit user_posts_path(user)
    expect(page).to have_content(post.title)
  end

  it 'displays some of the posts body' do
    visit user_posts_path(user)
    expect(page).to have_content(post.text)
  end

  it 'displays the first comments on a post' do
    visit user_posts_path(user)
    expect(page).to have_content('Post 1')
  end

  it 'displays how many comments a post has' do
    visit user_posts_path(user)
    expect(page).to have_content("Comment: #{post.comments_counter}")
  end

  it 'displays how many likes a post has' do
    visit user_posts_path(user)
    expect(page).to have_content("Like: #{post.likes_counter}")
  end

  it 'displays a button for pagination' do
    visit user_posts_path(user)
    expect(page).to have_button('Pagination')
  end

  it 'redirects to a posts show page when clicking on a post' do
    visit user_posts_path(user)
    click_link 'My Post 2'
    expect(current_path).to eq(user_post_path(user, post2))
  end
end
