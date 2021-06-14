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
#  index_invites_on_organization_id  (organization_id)
#  index_invites_on_user_id          (user_id)
#
FactoryBot.define do
  factory :invite do
    invite_token { Digest::SHA1.hexdigest([self.organization_id, Time.now, rand].join) }
    recipient_email { Faker::Internet.email }
    organization
    user
  end
end
