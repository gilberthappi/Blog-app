require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Cesar Molina') }

  describe 'validations' do
    it 'requires title to be present' do
      post = Post.new(title: nil, author: user)
      expect(post).to_not be_valid
    end

    it 'requires title to be less than 251 characters' do
      post = Post.new(
        title: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
    Aenean commodo ligula eget dolor. Aenean massa.
    Cum sociis natoque penatibus et magnis dis parturient montes,
    nascetur ridiculus mus. Nullam sed purus ullamcorper,
    aliquam libero ac, euismod augue. Cum sociis natoque
    penatibus et magnis dis parturient montes, nascetur
    ridiculus mus. Nullam sed purus ullamcorper,
    aliquam libero ac, euismod augue', author: user
      )
      expect(post).to_not be_valid
    end

    it 'requires likes_counter to be an integer' do
      post = Post.new(likes_counter: 'invalid', author: user, title: 'Valid Title')
      expect(post).to_not be_valid
    end

    it 'requires likes_counter to be greater than or equal to 0' do
      post = Post.new(likes_counter: -1, author: user, title: 'Valid Title')
      expect(post).to_not be_valid

      post.likes_counter = 0
      expect(post).to be_valid
    end
  end

  it 'requires comments_counter to be an integer' do
    post = Post.new(comments_counter: 'invalid', author: user, title: 'Valid Title')
    expect(post).to_not be_valid
  end

  it 'requires comments_counter to be greater than or equal to 0' do
    post = Post.new(comments_counter: -1, author: user, title: 'Valid Title')
    expect(post).to_not be_valid

    post.comments_counter = 0
    expect(post).to be_valid
  end

  describe '#update_posts_counter' do
    it 'updates posts_counter' do
      post = Post.create(title: 'Sample Post', author: user)
      post.send(:posts_counter_update)
      expect(user.reload.posts_counter).to eq(1)
    end
  end

  describe '#five_most_recent_comments' do
    it 'returns 5 most_recent_comments' do
      post = Post.create(title: 'Hello World!', author: user)
      comment_one = Comment.create(user:, post:, text: 'comment 1', created_at: 10.days.ago)
      comment_two = Comment.create(user:, post:, text: 'comment 2', created_at: 9.days.ago)
      comment_three = Comment.create(user:, post:, text: 'comment 3', created_at: 7.days.ago)
      comment_four = Comment.create(user:, post:, text: 'comment 4', created_at: 5.days.ago)
      comment_five = Comment.create(user:, post:, text: 'comment 5', created_at: 3.days.ago)

      expect(post.five_most_recent_comments).to eq([comment_five, comment_four, comment_three, comment_two,
                                                    comment_one])
    end
  end
end
