FactoryBot.define do
  factory :feedback, class: Feedback do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    reason { Feedback::REASONS.sample }
    message { Faker::Lorem.sentence(word_count: 10) }
    subject { Faker::Lorem.characters(number: 15) }
  end
end
