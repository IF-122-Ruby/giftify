FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65)}
    avatar { Faker::LoremFlickr.image }
    email { Faker::Internet.email }
    password {Faker::Internet.password}
  end
end
