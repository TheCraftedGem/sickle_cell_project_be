FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    zip_code { Faker::Address.zip_code.to_i }
    phone_number { Faker::PhoneNumber.phone_number }
    last_visit { rand(10.years).seconds.ago }
    date_of_birth { rand(10.years).seconds.ago }
    office_id { 1 }
    appointment_id { 1 }
    after :create do |patient|
      create_list :scan, 3, patient: patient
    end
  end
end
