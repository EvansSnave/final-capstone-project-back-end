require 'rails_helper'

RSpec.describe DetailsController, type: :controller do
  let(:user) { create(:user) }
  let(:city) { create(:city) }
  let(:doctor) { create(:doctor, user:, city:) }
  let(:detail) { create(:detail, doctor:) }

  describe 'GET #show' do
    before do
      get :show, params: { id: detail.id }, format: :json
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'JSON body response contains expected detail attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(%w[id price specialization studies doctor_id created_at
                                                   updated_at])
    end

    it 'responds with the correct detail' do
      expect(response.body).to eq(detail.to_json)
    end
  end
end
