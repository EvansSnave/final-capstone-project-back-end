require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  params = {
    email: 'kevin@email.com',
    password: 'password',
    password_confirmation: 'password'
  }

  before do
    post '/users/tokens/sign_up', as: :json, params:
  end

  describe 'GET /home' do
    it 'returns http success' do
      get '/pages/home'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'registrations' do
    it 'validates new user registrations' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'login system' do
    it 'validates user login' do
      post('/users/tokens/sign_in', as: :json, params:)
      expect(response).to have_http_status(:success)
      response_json = JSON.parse(response.body)
      expect(response_json).to have_key('resource_owner')
      resource_owner_email = response_json['resource_owner']['email']
      expect(resource_owner_email).to eq('kevin@email.com')
    end
  end
end
