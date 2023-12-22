require 'rails_helper'
require 'data/data_test'
require 'capybara'

RSpec.describe 'User show page', type: :feature do
  include FakerData
  before(:each) do
    fetch_data
  end
  before do
    visit user_path(@user1)
  end

  let!(:post11) do
    Post.create(title: 'This is my Post Number 11', text: 'My post', author_id: @user1.id, comments_counter: 0,
                likes_counter: 0)
  end

  it 'displays the user\'s profile picture' do
    expect(page).to have_css('img.user_avatar')
  end

  it "displays the user's username" do
    expect(page).to have_content(@user1.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 1')
  end

  it "displays a button to view all of a user's posts" do
    expect(page).to have_link('See all posts', href: user_posts_path(@user1))
  end

  it 'redirects to the user post index page when clicking on "See all posts"' do
    click_link('See all posts')
    expect(current_path).to eq(user_posts_path(@user1))
  end
end
