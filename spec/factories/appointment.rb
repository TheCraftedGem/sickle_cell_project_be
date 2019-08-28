FactoryBot.define do
  factory :appointment do
    date { rand(10.years).seconds.ago }
    appointment_result { rand(5) }
    association :user, factory: :user
    association :patient, factory: :patient
    association :office, factory: :office
  end
end
