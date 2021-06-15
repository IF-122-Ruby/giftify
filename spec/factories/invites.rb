# == Schema Information
#
# Table name: invites
#
#  id              :bigint           not null, primary key
#  invite_token    :string
#  recipient_email :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_invites_on_invite_token     (invite_token) UNIQUE
#  index_invites_on_organization_id  (organization_id)
#  index_invites_on_user_id          (user_id)
#
FactoryBot.define do
  factory :invite, class: Invite do
    recipient_email { Faker::Internet.email }
    organization
    association :sender, factory: :user
  end
end
