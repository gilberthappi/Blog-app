require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'List Posts' do
    before(:example) { get '/user/1/post' }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders users index view' do
      expect(response).to render_template(:index)
    end

    it 'shows content in the view' do
      expect(response.body).to include('All Posts are here !!')
    end
  end

  describe 'Show Post' do
    before(:example) { get '/user/1/post/1' }

    it 'renders show view' do
      expect(response.body).to render_template('show')
    end
    it 'shows contents in the view' do
      expect(response.body).to include('Details of a single post')
    end
  end
end
