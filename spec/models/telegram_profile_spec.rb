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
