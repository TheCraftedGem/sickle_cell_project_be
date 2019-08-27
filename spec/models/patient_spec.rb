require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:street_address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip_code)}
    it {should validate_presence_of(:last_visit)}
  end

  describe 'relationships' do
    it {should have_many(:offices)}
    it {should have_many(:scans)}
    it {should have_many(:appointments)}
  end
end
