require 'rails_helper'

RSpec.describe '/users', type: :request do
  describe 'GET /index' do
    before(:example) do
      get '/users'
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'renders the correct body content' do
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'GET /show' do
    before(:example) do
      get '/users/1'
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template('show')
    end

    it 'renders the correct body content' do
      expect(response.body).to include('This is user id')
    end
  end
end
