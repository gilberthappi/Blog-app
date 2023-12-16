require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Creation' do
    subject { Comment.new(author_id: 1, post_id: 2) }

    before { subject.save }

    it 'Author id must be an integer' do
      subject.author_id = 'Janet'
      expect(subject).to_not be_valid
    end

    it 'author id must be an integer greater or equal to zero' do
      subject.author_id = -1
      expect(subject).to_not be_valid
    end

    it 'post id must be an integer' do
      subject.post_id = 'Janet'
      expect(subject).to_not be_valid
    end

    it 'post id must be an integer greater or equal to zero' do
      subject.post_id = -1
      expect(subject).to_not be_valid
    end
  end
end
