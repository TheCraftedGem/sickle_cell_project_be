FactoryBot.define do
  factory :appointment do
    date { "2019-04-23 11:00:15" }
    last_visit { "2019-04-23 11:00:15" }
    appointment_result { 1 }
    association :user, factory: :user
    association :patient, factory: :patient
    association :office, factory: :office
  end
end
