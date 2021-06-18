# == Schema Information
#
# Table name: gifts
#
#  id              :bigint           not null, primary key
#  amount          :integer
#  description     :text
#  favorite        :boolean          default(FALSE)
#  gift_type       :string
#  image           :string
#  name            :string
#  price           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_gifts_on_organization_id  (organization_id)
#  index_gifts_on_user_id          (user_id)
#
FactoryBot.define do
  factory :gift do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence(word_count: 10) }
    amount { 100 }
    gift_type { Gift::MERCH }
    price { Faker::Number.number(digits: 2) }
    organization

    trait :with_image do
      image { Rack::Test::UploadedFile.new(Rails.root + "spec/files/gifts/#{rand(1..10)}.jpg", 'image/jpeg') }
    end
  end
end
