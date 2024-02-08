require 'rails_helper'

RSpec.describe "Details", type: :request do
  let(:user) { create(:user) }
  let(:city) { create(:city) }
  let(:doctor) { create(:doctor, user: user, city: city) }
  let(:detail) { create(:detail, doctor: doctor) }

  describe 'GET /show' do
    before do
      get "/details/#{detail.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON body response contains expected detail attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[id price specialization studies doctor_id created_at updated_at])
    end

    it 'responds with the correct detail' do
      expect(response.body).to eq(detail.to_json)
    end
  end
end
