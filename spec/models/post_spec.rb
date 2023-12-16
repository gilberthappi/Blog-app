require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    subject do
      user1 = User.new(name: 'Janet', Photo: 'https://unsplash.com/photos/2LowviVHZ-F',
                       bio: 'I am twenty two years old', posts_counter: 0)
      Post.new(title: 'Hello World', text: 'This is my first post and I am happy', comments_counter: 2,
               likes_counter: 3, author_id: user1.id)
    end

    before { subject.save }

    it 'title must not be blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title must not exceed 250 characters' do
      subject.title = 'b' * 251
      expect(subject).to_not be_valid
    end

    it 'comments_counter must be an integer' do
      subject.comments_counter = 0.01
      expect(subject).to_not be_valid
    end

    it 'comments_counter must be greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes_counter must be greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
