require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/pages/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /restricted" do
    it "returns http success" do
      get "/pages/restricted"
      expect(response).to have_http_status(:success)
    end
  end

end
