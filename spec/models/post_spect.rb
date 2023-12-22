# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: 'Test User', posts_counter: 0, photo_url: 'https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_640.jpg') }

  it 'is not valid without a title' do
    post = Post.new(title: nil, text: 'Valid text', comments_counter: 0, likes_counter: 0, author: user)
    expect(post).to_not be_valid
  end

  it 'is not valid without text' do
    post = Post.new(title: 'Valid Title', text: nil, comments_counter: 0, likes_counter: 0, author: user)
    expect(post).to_not be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post = Post.new(title: 'Valid Title', text: 'Valid text', comments_counter: -1, likes_counter: 0, author: user)
    expect(post).to_not be_valid
  end

  it 'is not valid with a negative likes_counter' do
    post = Post.new(title: 'Valid Title', text: 'Valid text', comments_counter: 0, likes_counter: -1, author: user)
    expect(post).to_not be_valid
  end

  describe '#update_user_posts_counter' do
    it 'updates the author\'s posts_counter' do
      post = Post.create!(title: 'Valid Title', text: 'Valid text', comments_counter: 0, likes_counter: 0, author: user)

      expect { post.update_user_posts_counter }.to change { user.reload.posts_counter }.by(1)
    end
  end

  describe '#five_most_recent_comments' do
    it 'returns the five most recent comments' do
      post = Post.create!(title: 'Valid Title', text: 'Valid text', comments_counter: 0, likes_counter: 0, author: user)
      valid_text = 'This is a valid comment text.'

      recent_comments = 5.times.map do |i|
        Comment.create!(text: "#{valid_text} #{i}", post:, user:, created_at: i.days.ago)
      end

      expect(post.five_most_recent_comments).to match_array(recent_comments.reverse)
    end
  end

  describe '#update_likes_counter' do
    it 'updates the likes_counter' do
      post = Post.create!(title: 'Valid Title', text: 'Valid text', comments_counter: 0, likes_counter: 0, author: user)

      3.times { Like.create!(post:, user:) }

      post.update_column(:likes_counter, post.likes.count)

      expect(post.reload.likes_counter).to eq(3)
    end
  end
end
