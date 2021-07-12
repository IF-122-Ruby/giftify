# == Schema Information
#
# Table name: telegram_profiles
#
#  id               :bigint           not null, primary key
#  connection_token :string
#  first_name       :string
#  last_name        :string
#  username         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  telegram_id      :string
#  user_id          :bigint
#
# Indexes
#
#  index_telegram_profiles_on_connection_token  (connection_token) UNIQUE
#  index_telegram_profiles_on_telegram_id       (telegram_id) UNIQUE
#  index_telegram_profiles_on_user_id           (user_id)
#
require 'rails_helper'

RSpec.describe TelegramProfile, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).optional(true) }
  end

  describe 'validation' do
    it { is_expected.to validate_uniqueness_of :telegram_id }

    context "when valid Factory telegram_profile" do
      it "has a valid TelegramProfile" do
        expect(build(:telegram_profile)).to be_valid
      end
    end
  end
end
