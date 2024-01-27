require 'rails_helper'

RSpec.describe 'CurrentUsers', type: :request do
  user = {
    user: {
      name: 'kevin',
      email: 'kevin@email.com',
      password: 'password',
      password_confirmation: 'password'
    }
  }

  before do
    post '/signup', params: user
  end

  describe 'POST /signup' do
    it 'creates a new user' do
      expect(response).to have_http_status(:success)
      reponse_json = JSON.parse(response.body)
      expect(reponse_json['data']['email']).to eq('kevin@email.com')
    end
  end

  describe 'POST /login' do
    it 'logs in users' do
      post '/login', params: user
      expect(response).to have_http_status(:success)
      reponse_json = JSON.parse(response.body)
      expect(reponse_json['status']['message']).to eq('Logged in successfully')
    end
  end
end
