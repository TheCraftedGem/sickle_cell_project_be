require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:zip_code)}
    it {should validate_presence_of(:phone_number)}
    it {should validate_presence_of(:last_visit)}
    it {should validate_presence_of(:date_of_birth)}
  end

  describe 'relationships' do
    it {should have_many(:offices)}
    it {should have_many(:scans)}
    it {should have_many(:appointments)}
  end
end
