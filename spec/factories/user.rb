FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { 'Doe' }
    birthday {Date.new(1990, 3, 3)}
    avatar { 'temp.jpg' }
    email { 'john.doe@example.com' }
  end
  factory :random_user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65)}
    avatar { Faker::LoremFlickr.image }
    email { Faker::Internet.email }
  end
end