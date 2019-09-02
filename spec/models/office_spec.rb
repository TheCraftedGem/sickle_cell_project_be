require 'rails_helper'

RSpec.describe Office, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:street_address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip_code)}
    it {should validate_presence_of(:phone_number)}
  end

  describe 'relationships' do
    it {should have_many(:patients)}
    it {should have_many(:users)}
    it {should have_many(:appointments)}
  end
end
