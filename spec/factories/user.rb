FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65)}
    avatar { Faker::LoremFlickr.image }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }

    trait :with_superadmin_role do
      role
      after(:create) do |user|
        user.role.superadmin!
      end
    end

    trait :with_admin_role do
      role
      after(:create) do |user|
        user.role.admin!
      end
    end

    trait :with_user_role do
      role
    end
  end
end
