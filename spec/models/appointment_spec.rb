require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:last_visit)}
  end
end
