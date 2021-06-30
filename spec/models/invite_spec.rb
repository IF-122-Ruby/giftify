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
require 'rails_helper'

RSpec.describe Invite, type: :model do
  let(:invite) { build(:invite) }

  describe 'relations' do
    it { should belong_to(:organization).class_name('Organization') }
    it { should belong_to(:sender).class_name('User') }
  end

  it 'has a valid Factory' do
    expect(invite).to be_valid
  end

  describe "Role validation" do
    it 'has valid role' do
      invite.recipient_role = "manager"
      expect(invite).to be_valid
    end

    it 'has invalid role' do
      invite.recipient_role = "guest"
      expect(invite).to_not be_valid
    end
  end

end
