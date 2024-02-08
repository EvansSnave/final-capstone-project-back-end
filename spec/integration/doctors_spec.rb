require 'swagger_helper'

describe 'Doctors API' do
  path '/doctors' do
    get 'Retrieves all doctors' do
      produces 'application/json'
      response '200', 'doctors retrieved' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   age: { type: :integer },
                   description: { type: :string },
                   avatar: { type: :string },
                   image_url: { type: :string },
                   detail: {
                     type: :object,
                     properties: {
                       price: { type: :integer },
                       specialization: { type: :string },
                       studies: { type: :string }
                     }
                   }
                 },
                 required: %w[id name age description avatar image_url detail]
               }

        run_test!
      end
    end

    post 'Creates a doctor' do
      consumes 'application/json'
      produces 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          age: { type: :integer },
          description: { type: :string },
          avatar: { type: :string },
          image_url: { type: :string },
          detail_attributes: {
            type: :object,
            properties: {
              price: { type: :integer },
              specialization: { type: :string },
              studies: { type: :string }
            }
          }
        },
        required: %w[name age description avatar image_url detail_attributes]
      }

      response '201', 'doctor created' do
        let(:doctor) { { name: 'John', age: 30, description: 'A good doctor', avatar: 'avatar.jpg', image_url: 'http://example.com/image.jpg', detail_attributes: { price: 100, specialization: 'Cardiology', studies: 'MBBS' } } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { name: 'John' } }
        run_test!
      end
    end
  end

  path '/doctors/{id}' do
    get 'Retrieves a doctor' do
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'doctor found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 age: { type: :integer },
                 description: { type: :string },
                 avatar: { type: :string },
                 image_url: { type: :string },
                 detail: {
                   type: :object,
                   properties: {
                     price: { type: :integer },
                     specialization: { type: :string },
                     studies: { type: :string }
                   }
                 }
               },
               required: %w[id name age description avatar image_url detail]

        let(:id) do
          Doctor.create(name: 'John', age: 30, description: 'A good doctor', avatar: 'avatar.jpg',
                        image_url: 'http://example.com/image.jpg', detail_attributes: { price: 100, specialization: 'Cardiology', studies: 'MBBS' }).id
        end
        run_test!
      end

      response '404', 'doctor not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Deletes a doctor' do
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '204', 'doctor deleted' do
        let(:id) do
          Doctor.create(name: 'John', age: 30, description: 'A good doctor', avatar: 'avatar.jpg',
                        image_url: 'http://example.com/image.jpg', detail_attributes: { price: 100, specialization: 'Cardiology', studies: 'MBBS' }).id
        end
        run_test!
      end

      response '404', 'doctor not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
