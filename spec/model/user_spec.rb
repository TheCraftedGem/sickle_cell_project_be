require 'rails_helper'

  describe User, type: :model do
    describe 'validations' do
      it {should validate_presence_of(:email)}
      it {should validate_presence_of(:first_name)}
      it {should validate_presence_of(:last_name)}
      it {should validate_presence_of(:password_digest)}
    end
  end
