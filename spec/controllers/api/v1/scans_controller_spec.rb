require 'rails_helper'

RSpec.describe Api::V1::ScansController, type: :api do
  before(:each) do
    create(:appointment)
    token = JsonWebToken.encode({user_id: User.first.id})
    header "AUTHORIZATION", "Bearer #{token}"
  end

  context 'When the scan doesnt exist it' do
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

    it 'it returns an ok status' do
      expect(last_response.status).to eq 200
    end

    it 'it returns the correct scan' do
      expect(json['data']['attributes']['result']).to eq(Scan.find(1).result)
    end
  end

  context 'It can create a scan and' do
    before do
      post "/api/v1/scan_create", scan: { result: "moderate", note: "New note", patient_id: 1, office_id: 1 }
    end

    it 'it returns an ok status' do
      expect(last_response.status).to eq 200
    end
  end

  context 'It can update a scan and' do
    before do
      patch "/api/v1/scan_update?patient_id=1", scan: { result: "severe"}
    end

    it 'it returns an ok status' do
      expect(last_response.status).to eq 200
    end

    it 'it modifies the right scan with new information' do
      expect(Scan.find(3).result).to eq("severe")
    end
  end

  context 'It can delete a scan and' do
    before do
      delete '/api/v1/scan_delete?id=2'
    end

    it 'it returns an ok status' do
      expect(last_response.status).to eq 200
    end

    it 'it deletes the correct scan' do
      expect{Scan.find(2)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
