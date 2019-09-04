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
  end
end
