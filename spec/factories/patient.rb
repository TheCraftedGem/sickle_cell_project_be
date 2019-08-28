FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code.to_i }
    phone_number { Faker::PhoneNumber.phone_number }
    last_visit { rand(10.years).seconds.ago }
    office_id { 1 }
    appointment_id { 1 }
    scan_id { 1 }
  end
end
