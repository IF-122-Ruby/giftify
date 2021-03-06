FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65)}
    avatar { File.open(Rails.root + "spec/files/user_avatars/#{rand(1..10)}.jpg") }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }

    trait :with_organization do
      organization
    end

    trait :superadmin do
      role { build(:role, role: :superadmin) }
    end

    trait :admin do
      role { build(:role, role: :admin) }
    end

    trait :manager do
      role { build(:role, role: :manager) }
    end

    trait :simple do
      role
    end
  end
end
