require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = create(:user)
    sign_in @user
  end

  describe 'GET /users' do
    it 'returns http success and all users' do
      get '/users'
      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body)

      expect(json.length).to eq(User.count)

      expect(json.first['id']).to eq(User.first.id)
    end
  end
end
