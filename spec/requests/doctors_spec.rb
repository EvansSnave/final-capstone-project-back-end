require 'swagger_helper'

RSpec.describe 'doctors', type: :request do

  path '/doctors' do

    get('list doctors') do
      response(200, 'successful') do

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

    post('create doctor') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            age: { type: :integer },
            city_id: { type: :integer },
            user_id: { type: :integer },
            description: { type: :string },
            image_url: { type: :string },
            detail_attributes: {
              type: :object,
              properties: {
                price: { type: :integer },
                specialization: { type: :string },
                studies: { type: :string }
              },
            },
          },
          required: %w[
            name age city_id user_id description image_url
            detail_attributes price specialization studies
          ]
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

  path '/doctors/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show doctor') do
      response(200, 'successful') do
        let(:id) { '123' }

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

    delete('delete doctor') do
      response(200, 'successful') do
        let(:id) { '123' }

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
