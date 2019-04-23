FactoryBot.define do
  factory :patient do
    name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip_code { 1 }
    last_visit { "2019-04-23 10:54:18" }
    office_id { 1 }
    appointment_id { 1 }
    scan_id { 1 }
  end
end
