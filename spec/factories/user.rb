FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65)}
    avatar { Faker::LoremFlickr.image }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 10) }

    trait :with_organization_and_role do
      after(:create) do |user|
        FactoryBot.create(:organization, user: user)
        FactoryBot.create(:role, user: user, organization: organization, role: Role::ADMIN)
      end
    end
  end
end
