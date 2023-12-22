require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    before :each do
      get '/users'
    end

    it 'returns success status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index view' do
      expect(response).to render_template(:index)
    end

    it 'include the correct placeholder text' do
      expect(response.body).to include('Number of posts:')
    end
  end

  describe 'GET /show' do
    def valid_attributes
      { name: 'Fatema', bio: 'Fatema\'s bio', posts_counter: 0 }
    end
    let(:user) { User.create! valid_attributes }

    it 'returns success status' do
      get user_url(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders show view' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'include the correct placeholder text' do
      get user_path(user)
      expect(response.body).to include('Number of posts:')
    end
  end
end
