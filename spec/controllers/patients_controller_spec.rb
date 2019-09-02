require 'rails_helper'
require 'jwt'

RSpec.describe Api::V1::PatientsController, type: :api do

  context "When the patient doesn't exist"
    
    before do
      create(:appointment)
      token = JsonWebToken.encode({user_id: User.first.id})
      header "ACCESS_TOKEN", "Bearer #{token}"
      get "/api/v1/patient?id=100"
    end

    it 'responds with a 404 status' do
      expect(last_response.status).to eq 404
    end

    it 'responds with a message of not found' do
      message = json[last_response.body["message"]]
      expect(message).to eq("Patient was not found.")
    end
end
