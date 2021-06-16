# == Schema Information
#
# Table name: notifications
#
#  id                    :bigint           not null, primary key
#  message               :text
#  notification_type     :string
#  notificationable_type :string
#  read                  :boolean          default(FALSE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  notificationable_id   :bigint
#  user_id               :bigint
#
# Indexes
#
#  index_notifications_on_notificationable  (notificationable_type,notificationable_id)
#  index_notifications_on_read              (read)
#  index_notifications_on_user_id           (user_id)
#
require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:notification) { build(:notification) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
  describe "validation" do
    context "when valid Factory notification" do
      it "has a valid Notification" do
        expect(build(:notification)).to be_valid
      end
    end
  end
end
