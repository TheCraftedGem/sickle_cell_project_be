FactoryBot.define do
  factory :scan do
    result { "MyString" }
    created_at { "2019-04-23 11:01:46" }
    updated_at { "2019-04-23 11:01:46" }
    patient
    office_id { 1 }
  end
end
