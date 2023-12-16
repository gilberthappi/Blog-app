require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    let(:user) { User.create(name: 'Olivia Straub Benites') }
    let(:post) { Post.create(title: 'Testing Post', author: user) }

    it 'increments the post likes_counter when a like is created' do
      Like.create(user:, post:)

      expect(post.reload.likes_counter).to eq(1)
    end
  end

  context 'when creating a like' do
    let(:user) { User.create(name: 'Cesar Molina') }
    let(:post) { Post.create(title: 'Another Post', author: user) }

    it 'increases the likes_counter of the associated post' do
      Like.create(user:, post:)

      expect(post.reload.likes_counter).to eq(1)
    end

    it 'does not increase likes_counter for another post' do
      other_post = Post.create(title: 'Different Post', author: user)
      Like.create(user:, post: other_post)

      expect(other_post.reload.likes_counter).to eq(1)
    end

    it 'handles likes from different users on the same post' do
      other_user = User.create(name: 'Bob')
      Like.create(user: other_user, post:)
      Like.create(user:, post:)

      expect(post.reload.likes_counter).to eq(2)
    end
  end
end
