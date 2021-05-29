# == Schema Information
#
# Table name: organizations
#
#  id            :bigint           not null, primary key
#  logo          :string
#  monthly_point :integer          default(10)
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_organizations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :organization, class: Organization do
    name { Faker::Company.name }
    user
    logo { Faker::Avatar.image }
  end
end
