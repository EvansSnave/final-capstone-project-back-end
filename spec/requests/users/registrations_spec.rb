require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  path '/signup' do

    post('Create a new user') do
      tags 'Users'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            email: { type: :string, format: :email},
            password: { type: :string, format: :password },
            password_confirmation: { type: :string, format: :password }
          },
          required: %w[name email password]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
