require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'List Users' do
    before(:example) { get '/user' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders users index view' do
      expect(response).to render_template(:index)
    end

    it 'shows content in the view' do
      expect(response.body).to include('List of Users')
    end
  end

  describe 'Show' do
    before(:example) { get '/user/1' }

    it 'responds with the code 400' do
      expect(response).to have_http_status(:success)
    end
    it 'renders show view' do
      expect(response).to render_template(:show)
    end
    it 'shows contents in the view' do
      expect(response.body).to include('User Details')
    end
  end
end
