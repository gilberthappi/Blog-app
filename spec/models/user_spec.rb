require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Edward', Photo: 'https://unsplash.com/photos/2LowviVHZ-E', Bio: 'This is the story of my life', PostsCounter: 0) }

  before { subject.save }

  it 'name should not be empty' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be blank' do
    subject.Name = '   '
    expect(subject).to_not be_valid
  end

  it 'postscounterempty' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'post should not be blank' do
    subject.Name = '   '
    expect(subject).to_not be_valid
  end
end
