require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
    before :each do
    it "shows user's profile picture" do
      all('R.png').each do |i|
        expect(i[:src]).to eq('R.png')
      end
    end

    it 'shows the users username' do
      expect(page).to have_content('TTT')
    end

    it 'shows number of posts of user has written' do
      post = Post.all
      expect(post.size).to eql(4)
    end

    it 'shows number of posts by user' do
      user = User.first
      expect(page).to have_content(user.post_counter)
    end

    it 'shows posts title' do
      expect(page).to have_content('First Post')
    end

    it 'can see some of the post detail' do
      expect(page).to have_content 'This is my first post'
    end

    it 'can see the first comment on a post' do
      expect(page).to have_content 'Good job!'
    end

    it 'can see how many comments a post has.' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end

    it 'can see how many likes a post has.' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    it "redirects the user to the post's show page after clickin on it" do
      click_link 'First Post'
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
  end
end
