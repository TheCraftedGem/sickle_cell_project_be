FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code.to_i }
<<<<<<< HEAD
    phone_number { Faker::PhoneNumber.phone_number }
=======
    date_of_birth { "2019-04-23 11:00:15" }
>>>>>>> 6494ce7cfa25afa0f2eca3bd65bb5779f3661eb9
    last_visit { rand(10.years).seconds.ago }
    office_id { 1 }
    appointment_id { 1 }
    scan_id { 1 }
  end
end
