FactoryBot.define do
  factory :patient do
    name { Faker::Name.name }
    street_address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code.to_i }
    date_of_birth { "2019-04-23 11:00:15" }
    last_visit { rand(10.years).seconds.ago }
    office_id { 1 }
    appointment_id { 1 }
    scan_id { 1 }
  end
end
