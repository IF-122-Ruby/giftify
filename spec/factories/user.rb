FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65)}
    avatar { Faker::LoremFlickr.image }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }

    trait :superadmin do
      role { build(:role, role: :superadmin) }
    end

    trait :admin do
      role { build(:role, role: :admin) }
    end

    trait :simple do
      role
    end
  end
end
