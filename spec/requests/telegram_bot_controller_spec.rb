require 'rails_helper'

RSpec.describe TelegramBotController, telegram_bot: :rails do
  let!(:user) { create :user }

  describe '#start!' do
    subject { -> { dispatch_command :start } }

    context "when not logged" do
      before do
        dispatch_command :start
      end

      it { is_expected.to respond_with_message 'Click on the button below to connect to your Giftify account' }
    end
  end

  describe '#disconnect!' do
    subject { -> { dispatch_command :disconnect! } }

    context "when not logged" do
      before do
        dispatch_command :disconnect
      end

      it { is_expected.to respond_with_message 'Click on the button below to connect to your Giftify account' }
    end
  end

  describe '#balance!' do
    subject { -> { dispatch_command :balance } }

    context "when not logged" do
      before do
        dispatch_command :balance
      end

      it { is_expected.to respond_with_message 'Click on the button below to connect to your Giftify account' }
    end
  end
end
