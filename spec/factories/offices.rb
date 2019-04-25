FactoryBot.define do
  factory :office do
    name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip_code { 1 }
    phone_number { 1 }
    hours { "MyString" }
    provider_id { 1 }
    patient_id { 1 }
    appointment_id { 1 }
  end
end
