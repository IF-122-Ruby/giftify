# == Schema Information
#
# Table name: microposts
#
#  id              :bigint           not null, primary key
#  description     :text
#  image           :string
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :bigint
#  organization_id :bigint
#
# Indexes
#
#  index_microposts_on_author_id        (author_id)
#  index_microposts_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (organization_id => organizations.id)
#
FactoryBot.define do
  factory :micropost do
    title { Faker::IndustrySegments.industry }
    description { Faker::Marketing.buzzwords }
    association :author, factory: [:user, :admin, :with_organization]
    association :organization

    trait :with_image do
      image { Rack::Test::UploadedFile.new(Rails.root + "spec/files/microposts/#{rand(1..10)}.jpg", 'image/jpeg') }
    end
  end
end
