FactoryBot.define do
  factory :appointment do
    date { "2019-04-23 11:00:15" }
    last_visit { "2019-04-23 11:00:15" }
    office_id { 1 }
    patient_id { 1 }
  end
end
