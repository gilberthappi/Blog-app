require 'rails_helper'

RSpec.describe 'User Management', type: :request do
  let(:sample_user) do
    User.create(
      name: 'Ivonne Benites',
      photo: 'https://example.com/ivonnebenites.jpg',
      bio: 'Software Engineer',
      posts_counter: 0
    )
  end

  context 'User Index' do
    before { get users_path }

    it 'responds successfully' do
      expect(response).to have_http_status(:success)
    end

    it 'displays a list of users' do
      expect(response.body).to include('<h1>A list of users</h1>')
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  context 'User Details' do
    before { get user_path(sample_user) }

    it 'responds successfully' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'displays user information and posts' do
      expect(response.body).to include('<h2>User information and posts</h2>')
    end
  end
end
