require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  describe 'User' do
    before(:each) do

    it 'Shows the username' do
      expect(page).to have_content('Amy')
    end

    it "Shows the user's photo" do
      all('R.png').each do |i|
        expect(i[:src]).to eq('R.png')
      end
    end

    it 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    it "after clicking on the user, it will be redirected to that user's show page" do
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content 'Amy'
      expect(page).to have_no_content('jerry')
    end
  end
end
