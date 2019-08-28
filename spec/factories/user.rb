FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { 'admin' }
    phone_number { Faker::PhoneNumber.phone_number }
    status { 'active' }
    confirmation_code { nil }
    confirmed_at { rand(10.years).seconds.ago }
    office_id { 1 }
  end
end
