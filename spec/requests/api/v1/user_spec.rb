require 'rails_helper'

RSpec.describe 'POST /api/v1/users' do
  it 'returing user gets api key in response' do
    user = create(:user, email: 'whatever@example.com', password: "password" )

    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"

    expect(response).to be_successful
    
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to have_key(:data)
    expect(results[:data]).to have_key(:attributes)
    expect(results[:data][:attributes]).to have_key(:api_key)
    expect(results[:data][:attributes][:api_key]).to eq(user.api_key)
  end
  
  it 'should error with an invalid password' do
    user = create(:user, email: 'whatever@example.com', password: "password" )

    invalid = "invalid"


    post "/api/v1/sessions?email=#{user.email}&password=#{invalid}"


    expect(response.status).to eq(401)
    expect(response.body).to eq("Sorry Try Again")
  end
end