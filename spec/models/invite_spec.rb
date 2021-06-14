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
require 'rails_helper'

RSpec.describe Invite, type: :model do
  describe 'relations' do
    it { should belong_to :organization }
    it { should belong_to :user         }
  end
end
