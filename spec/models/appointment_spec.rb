require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:appointment_result)}
  end

  describe 'relationships' do
    it {should belong_to(:patient)}
    it {should belong_to(:office)}
    it {should belong_to(:user)}
  end
end
