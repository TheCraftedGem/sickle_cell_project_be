FactoryBot.define do
  factory :office do
    name { Faker::Company.name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code.to_i }
    phone_number { Faker::PhoneNumber.phone_number.to_i }
    hours { "9-5" }
    patient_id {1}
  end
end
