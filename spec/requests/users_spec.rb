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

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'displays a list of users' do
      expect(response.body).to include('<h1>All Users</h1>')
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
      expect(response.body).to include('<h2>Bio</h2>')
    end
  end
end
