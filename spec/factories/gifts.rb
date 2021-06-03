# == Schema Information
#
# Table name: gifts
#
#  id              :bigint           not null, primary key
#  amount          :integer
#  description     :text
#  gift_type       :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_gifts_on_organization_id  (organization_id)
#
FactoryBot.define do
  factory :gift do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence(word_count: 10) }
    amount { 100 }
    gift_type { Gift::MERCH }
    organization
  end
end
