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
    name { "MyString" }
    description { "MyText" }
    amount { 1 }
    gift_type { "MyString" }
    organization
  end
end
