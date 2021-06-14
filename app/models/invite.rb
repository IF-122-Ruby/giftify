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
class Invite < ApplicationRecord
  belongs_to :organization
  belongs_to :user

  before_create :generate_token

  def generate_token
    self.token = Digest::SHA1.hexdigest([organization_id, Time.now, rand].join)
  end
end
