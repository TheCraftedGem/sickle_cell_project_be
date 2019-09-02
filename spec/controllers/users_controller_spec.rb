require 'rails_helper'
require 'jwt'

RSpec.describe Api::V1::UsersController, type: :api do
  context 'When a user signs up' do
    it 'responds with a 200 status, a successful message, and sends an email' do
      post "/api/v1/user_create", user: { office_id: 1, first_name: 'John', last_name: 'Smith', email: 'user_1@example.com', password: 'Password123!', password_confirmation: 'Password123!', role: 'default', status: 'active', phone_number: '225 233-3232' }

      expect(last_response.status).to eq 200
      expect(ActionMailer::Base.deliveries.size).to eq 1
      expect(json[last_response.body["message"]]).to eq("The user #{User.find(1).email} was created, they will need to confirm their email.")
    end

    it 'sends the email to the correct user' do
      post "/api/v1/user_create", user: { office_id: 1, first_name: 'John', last_name: 'Smith', email: 'user_1@example.com', password: 'Password123!', role: 'default', status: 'active', phone_number: '225 233-3232' }

      expect(ActionMailer::Base.deliveries[1].body.encoded).to include("#{User.find(1).first_name}")
      expect(ActionMailer::Base.deliveries[1].body.encoded).to include("#{User.find(1).confirmation_code}")
    end
  end
end
