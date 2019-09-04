require 'rails_helper'

RSpec.describe Api::V1::ScansController, type: :api do
  before(:each) do
    create(:appointment)
    token = JsonWebToken.encode({user_id: User.first.id})
    header "AUTHORIZATION", "Bearer #{token}"
  end

  context 'When the scan doesnt exist' do
    before do
      get "/api/v1/scan?id=100"
    end

    it 'returns a not found status' do
      expect(last_response.status).to eq 404
    end
  end

  context 'When the scan exists' do
    before do
      get "/api/v1/scan?id=#{Scan.find(1).id}"
    end

    it 'returns an ok status' do
      expect(last_response.status).to eq 200
    end

    it 'returns the correct scan' do
      expect(json['data'][0]['attributes']['result']).to eq(Scan.find(1).result)
    end
  end
end
