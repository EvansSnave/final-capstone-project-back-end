require 'rails_helper'

RSpec.describe 'CurrentUser', type: :request do
  before do
    @user = create(:user)
  end

  describe 'GET /current_user' do
    context 'when user is signed in' do
      before do
        sign_in @user
      end

      it "returns http success and the current user's data" do
        get '/current_user'
        expect(response).to have_http_status(:success)

        json = JSON.parse(response.body)

        expect(json['id']).to eq(@user.id)
      end
    end

    context 'when user is not signed in' do
      it 'returns http unauthorized' do
        get '/current_user'
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
