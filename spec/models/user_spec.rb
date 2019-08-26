require 'rails_helper'

  describe User, type: :model do
    describe 'validations' do
      it {should validate_presence_of(:email)}
      it {should validate_presence_of(:first_name)}
      it {should validate_presence_of(:last_name)}
      it {should validate_presence_of(:password)}
      it {should validate_presence_of(:street_address)}
      it {should validate_presence_of(:city)}
      it {should validate_presence_of(:state)}
      it {should validate_presence_of(:zip_code)}
      it {should validate_presence_of(:role)}
      it {should validate_presence_of(:status)}
    end

    describe 'relationships' do
      it {should have_many(:offices)}
    end

    describe 'default user creation' do
      it "should create user with default status/role" do
        @user_1 = User.create(email: "user_1@email.com", first_name: "user_1", last_name: "first", password: "user_1", street_address: "123 Fake St", city: "Denver", state: "CO", zip_code: 80202)
binding.pry
        expect(@user_1.status).to eq("inactive")
        expect(@user_1.role).to eq("default")
      end
    end
  end
