# == Schema Information
#
# Table name: invites
#
#  id              :bigint           not null, primary key
#  invite_token    :string
#  recipient_email :string
#  recipient_role  :string           default("user"), not null
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
class Invite < ApplicationRecord
  belongs_to :organization
  belongs_to :sender, class_name: 'User', foreign_key: :user_id

  validates :invite_token, uniqueness: true, presence: true
  validates :recipient_email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :recipient_role, inclusion: { in: Role.roles.values.excluding('superadmin') }

  before_validation :generate_token, on: :create
  after_commit :send_invite_email, on: :create

  scope :by_created_at, -> { order(created_at: :desc) }

  def send_invite_email
    InviteMailer.new_user_invite(self).deliver_now
  end

  private

  def generate_token
    self.invite_token = Digest::SHA1.hexdigest([organization_id, Time.zone.now, rand].join)
  end
end
