require 'rails_helper'

RSpec.describe User, type: :model do
  let(:new_user) { User.new(name: 'Ivonne', bio: 'Software Developer', posts_counter: 1) }
  before { new_user.save }

  context 'with valid attributes' do
    it 'is valid' do
      expect(new_user).to be_valid
    end
  end

  context 'with missing name' do
    it 'is not valid' do
      new_user.name = nil
      expect(new_user).not_to be_valid
    end
  end

  context 'with a different valid name' do
    it 'is valid' do
      new_user.name = 'Cesar Molina'
      expect(new_user).to be_valid
    end
  end

  context 'with missing posts counter' do
    it 'is not valid' do
      new_user.posts_counter = nil
      expect(new_user).not_to be_valid
    end
  end

  context 'with a different valid posts counter' do
    it 'is valid' do
      new_user.posts_counter = 5
      expect(new_user).to be_valid
    end
  end

  it 'returns the 3 most recent posts' do
    new_user = User.create(name: 'Olivia Straub Benites')
    first_post = Post.create(title: 'First post', author: new_user, created_at: 5.days.ago)
    second_post = Post.create(title: 'Second post', author: new_user, created_at: 3.days.ago)
    third_post = Post.create(title: 'Third post', author: new_user, created_at: 1.days.ago)
    expect(new_user.three_most_recent_posts).to eq([third_post, second_post, first_post])
  end
end
