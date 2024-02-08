require 'rails_helper'

RSpec.describe 'Doctors', type: :request do
  let(:user) { create(:user) }
  let(:city) { create(:city) }
  let(:doctor) { create(:doctor, user:, city:) }

  describe 'GET /index' do
    before do
      get '/doctors'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all doctors' do
      expect(JSON.parse(response.body).size).to eq(Doctor.count)
    end
  end

  describe 'GET /show' do
    before do
      get "/doctors/#{doctor.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct doctor' do
      expect(response.body).to eq(doctor.to_json)
    end
  end

  describe 'POST /create' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        {
          doctor: {
            name: Faker::Name.name,
            age: Faker::Number.between(from: 18, to: 100),
            city_id: city.id,
            user_id: user.id,
            description: Faker::Lorem.paragraph,
            avatar: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'test-image.jpg'),
                                                 'image/jpg'),
            image_url: Faker::Internet.url,
            detail_attributes: {
              price: Faker::Number.between(from: 0, to: 1000),
              specialization: Faker::Job.field,
              studies: Faker::Educator.degree
            }
          }
        }
      end

      it 'creates a new doctor' do
        expect do
          post '/doctors', params: valid_attributes
        end.to change(Doctor, :count).by(1)
      end

      it 'returns http created' do
        post '/doctors', params: valid_attributes
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
          doctor: {
            name: '',
            age: '',
            city_id: '',
            user_id: '',
            description: '',
            avatar: '',
            image_url: '',
            detail_attributes: {
              price: '',
              specialization: '',
              studies: ''
            }
          }
        }
      end

      it 'does not create a new doctor' do
        expect do
          post '/doctors', params: invalid_attributes
        end.not_to change(Doctor, :count)
      end

      it 'returns http unprocessable entity' do
        post '/doctors', params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes the doctor' do
      doctor
      expect do
        delete "/doctors/#{doctor.id}"
      end.to change(Doctor, :count).by(-1)
    end

    it 'returns http success' do
      delete "/doctors/#{doctor.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
