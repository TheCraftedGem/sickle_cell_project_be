require 'rails_helper'
require 'jwt'

RSpec.describe Api::V1::PatientsController, type: :api do
  before(:each) do
    create(:appointment)
    token = JsonWebToken.encode({user_id: User.first.id})
    header "ACCESS_TOKEN", "Bearer #{token}"
  end

  context "When the patient doesn't exist" do
    before do
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

  context 'When the patient does exist' do
    before do
      get "/api/v1/patient?id=1"
    end

    it 'responds with a 200 status' do
      expect(last_response.status).to eq 200
    end

    it 'responds with a message that the patient was found' do
      expect(json[last_response.body["message"]]).to eq("#{Patient.find(1).first_name} was found.")
    end
  end

  context "When the patient is successfully updated" do
    before do
      @patient = Patient.find(1)
      patch "/api/v1/patient_update?id=1", patient: {phone_number: '2253342323'}
    end

    it 'responds with a 200 status' do
      expect(last_response.status).to eq 200
    end

    it 'responds with a message that the patient was updated successfully' do
      expect(json[last_response.body["message"]]).to eq("#{Patient.find(1).first_name} was updated successfully.")
    end

    it 'changed the correct information' do
      expect(@patient.phone_number).not_to eq(Patient.find(1).phone_number)
    end
  end
end
