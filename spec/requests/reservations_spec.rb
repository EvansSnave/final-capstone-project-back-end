require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  let(:user) { create(:user) }
  let(:doctor) { create(:doctor) }
  let(:reservation) { create(:reservation, user: user, doctor: doctor) }

  describe 'GET #index' do
    before do
      get :index, params: { id: user.id }, format: :json
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all reservations for the user' do
      expect(JSON.parse(response.body).size).to eq(Reservation.where(user_id: user.id).count)
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: { id: reservation.id }, format: :json
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct reservation' do
      expect(response.body).to eq(reservation.to_json)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        {
          reservation: {
            user_id: user.id,
            doctor_id: doctor.id,
            schedule_date: Faker::Date.forward(days: 23)
          }
        }
      end

      it 'creates a new reservation' do
        expect {
          post :create, params: valid_attributes, format: :json
        }.to change(Reservation, :count).by(1)
      end

      it 'returns http success' do
        post :create, params: valid_attributes, format: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
          reservation: {
            user_id: '',
            doctor_id: '',
            schedule_date: ''
          }
        }
      end

      it 'does not create a new reservation' do
        expect {
          post :create, params: invalid_attributes, format: :json
        }.not_to change(Reservation, :count)
      end

      it 'returns http unauthorized' do
        post :create, params: invalid_attributes, format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the reservation' do
      reservation
      expect {
        delete :destroy, params: { id: reservation.id }, format: :json
      }.to change(Reservation, :count).by(-1)
    end

    it 'returns http success' do
      delete :destroy, params: { id: reservation.id }, format: :json
      expect(response).to have_http_status(:ok)
    end
  end
end
