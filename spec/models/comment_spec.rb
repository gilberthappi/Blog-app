require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    let(:user) { User.create(name: 'Lucia Rosas') }
    let(:post) { Post.create(title: 'Testing post', author: user) }

    it 'updates the posts comments_counter attribute' do
      Comment.create(user:, post:, text: 'Testing comment.')

      expect(post.reload.comments_counter).to eq(1)
    end
  end

  context 'when creating a comment' do
    let(:user) { User.create(name: 'Mario Lopez') }
    let(:post) { Post.create(title: 'Another Post', author: user) }

    it 'increases the comments_counter of the associated post' do
      Comment.create(user:, post:, text: 'A new comment')

      expect(post.reload.comments_counter).to eq(1)
    end

    it 'does not increase comments_counter for another post' do
      other_post = Post.create(title: 'Different Post', author: user)
      Comment.create(user:, post: other_post, text: 'Another comment')

      expect(other_post.reload.comments_counter).to eq(1)
    end

    it 'handles comments from different users on the same post' do
      other_user = User.create(name: 'Peter')
      Comment.create(user: other_user, post:, text: 'Peter\'s comment')
      Comment.create(user:, post:, text: 'Jane\'s comment')

      expect(post.reload.comments_counter).to eq(2)
    end
  end
end
