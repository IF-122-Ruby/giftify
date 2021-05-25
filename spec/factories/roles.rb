FactoryBot.define do
  factory :role do
    user
    organization
    role { 'user' }
  end
end
