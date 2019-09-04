require 'rails_helper'

RSpec.describe Api::V1::SearchController, type: :api do
  before(:each) do
    create(:appointment)
    token = JsonWebToken.encode({user_id: User.first.id})
    header "AUTHORIZATION", "Bearer #{token}"
  end

  context 'It can return a patient when searched for using first name' do
    before do
      get "/api/v1/search?query=#{Patient.find(1).first_name}"
    end

    it 'responds with a 200 status' do
      expect(last_response.status).to eq 200
    end

    it 'responds with the patients recorded information' do
      expect(json[0]["data"]["attributes"]["first_name"]).to eq(Patient.find(1).first_name)
    end
  end

  context "It can return a not found status if the patient doesn't exist" do
    before do
      get "/api/v1/search?query=Blue"
    end

    it 'responds with a 404 status' do
      expect(last_response.status).to eq 404
    end
  end
end
