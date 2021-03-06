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
require 'rails_helper'

RSpec.describe Organization, type: :model do
  context "when valid Factory organization" do
    it "has a valid organization" do
      expect(build(:organization)).to be_valid
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_numericality_of :monthly_point }
  end

  describe 'association' do
    it { is_expected.to belong_to :user }
  end

  describe "notification" do
    let(:organization) { create(:organization) }

    it "create new notification" do
      expect(organization.user.own_notifications.first.message).to eq("You created new organization #{organization.name}")
    end
  end
end
