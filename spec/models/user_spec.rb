require 'rails_helper'

  describe User, type: :model do
    describe 'validations' do
      it {should validate_presence_of(:email)}
      it {should validate_presence_of(:first_name)}
      it {should validate_presence_of(:last_name)}
      it {should validate_presence_of(:password_digest)}
      it {should validate_presence_of(:address)}
      it {should validate_presence_of(:city)}
      it {should validate_presence_of(:state)}
      it {should validate_presence_of(:zip_code)}
      it {should validate_presence_of(:role)}
      it {should validate_presence_of(:status)}
    end

    describe 'relationships' do
      it {should have_many(:offices)}
    end
  end
