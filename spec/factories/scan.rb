FactoryBot.define do
  factory :scan do
    result { rand(2) }
    note { Faker::Hipster.paragraph(sentence_count: 5) }
    office_id { 1 }
  end
end
