require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/reservations' do
    get('List all reservations') do
      tags 'Reservations'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        xit
      end
    end

    post('Create a reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            user_id: { type: :integer },
            doctor_id: { type: :integer },
            schedule_date: { type: :string, format: :datetime }
          },
          required: %w[user_id doctor_id]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        xit
      end
    end
  end

  path '/reservations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show a reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        xit
      end
    end

    delete('Delete a reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        xit
      end
    end
  end
end
