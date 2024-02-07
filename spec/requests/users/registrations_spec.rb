require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :request do
  describe 'POST /signup' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          user: {
            name: 'Paul',
            username: 'user1',
            email: 'testing2@example.com',
            password: 'Testing@123'
          }
        }
      end

      it 'creates a new user' do
        expect do
          post '/signup', params: valid_params
        end.to change(User, :count).by(1)

        expect(response).to have_http_status(:success)
        json = JSON.parse(response.body)
        expect(json['status']['message']).to eq('Signed up successfully')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          user: {
            name: 'Paul',
            username: 'user1',
            email: '',
            password: 'Testing@123'
          }
        }
      end

      it 'does not create a new user' do
        expect do
          post '/signup', params: invalid_params
        end.not_to change(User, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        json = JSON.parse(response.body)
        expect(json['status']['message']).to include("User couldn't be created successfully")
      end
    end
  end
end
