require 'rails_helper'

  describe User, type: :model do
    describe 'validations' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:password) }
      it { should validate_presence_of(:role) }
      it { should validate_presence_of(:status) }
      it { should validate_presence_of(:phone_number) }
    end

    describe 'relationships' do
      it { should have_many(:offices) }
    end

    describe 'default user creation' do
      it "should create user with default status/role" do
<<<<<<< HEAD
        @user_1 = User.create(email: "user_1@email.com", first_name: "user_1", last_name: "first", password: "user_1", phone_number: '1232332323')
=======
        @user_1 = User.create(email: "user_1@email.com", first_name: "user_1", last_name: "first", password: "user_1", street_address: "123 Fake St", city: "Denver", state: "CO", zip_code: 80202)
>>>>>>> 6494ce7cfa25afa0f2eca3bd65bb5779f3661eb9

        expect(@user_1.status).to eq("inactive")
        expect(@user_1.role).to eq("default")
      end
    end
  end
