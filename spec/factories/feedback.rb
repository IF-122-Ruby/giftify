FactoryBot.define do
  factory :feedback, class: Feedback do
    name { Faker::Name.name }
    reason { Faker::Lorem.word }
    subject { Faker::Lorem.characters(number: 15) }
    message { Faker::Lorem.sentence(word_count: 10) }
    email { Faker::Internet.email }
  end
end
