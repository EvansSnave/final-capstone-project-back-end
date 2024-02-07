require 'rails_helper'

RSpec.describe 'Users::Sessions', type: :request do
  before do
    @user = create(:user)
  end

  describe 'POST /login' do
    let(:valid_credentials) do
      {
        user: {
          username: @user.username,
          password: @user.password
        }
      }
    end

    it 'signs in the user' do
      post user_session_path, params: valid_credentials
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['data']['email']).to eq(@user.email)
    end
  end

  describe 'DELETE /logout' do
    before do
      # Sign in the user
      post user_session_path, params: { user: { username: @user.username, password: @user.password } }
      @auth_headers = response.headers.slice('Authorization')
    end

    it 'signs out the user' do
      delete destroy_user_session_path, headers: @auth_headers
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['message']).to eq('Logged out successfully')
    end

    it 'returns an error when user is not signed in' do
      delete destroy_user_session_path
      expect(response).to have_http_status(:unauthorized)
      json = JSON.parse(response.body)
      expect(json['message']).to eq("Couldn't find an active session.")
    end
  end
end
