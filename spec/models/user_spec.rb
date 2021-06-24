# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  birthday               :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  describe 'Birth date validations' do
    it { should allow_value(100.years.ago).for(:birthday) }
    it { should_not allow_value(100.days.from_now).for(:birthday) }
  end

  describe "notification" do
    let(:user) { create(:user, :with_organization) }

    it "create new notification" do
      expect(user.own_notifications.first.message).to eq("Welcome to organization #{user.organization.name}")
    end
  end
end
