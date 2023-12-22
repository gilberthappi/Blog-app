require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users/1/posts'
    end
    it 'returns success status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'include the correct placeholder text' do
      expect(response.body).to include('Number of posts:')
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/1/posts/1'
    end

    # it 'returns code 200' do
    #   expect(response).to have_http_status(:success)
    # end

    # it 'renders show' do
    #   expect(response).to render_template('posts/show')
    # end

    # it 'response body has the right placeholder' do
    #   expect(response.body).to include('Post#show')
    # end
  end
end
