require 'rails_helper'

RSpec.describe TelegramBotController, telegram_bot: :rails do
  let!(:user) { create :user }
  
  describe '#start!' do
    subject { -> { dispatch_command :start } }

    context "when not logged" do
      before do
        dispatch_command :start
      end

      it { is_expected.to respond_with_message 'Hi. Send /connect to get a link to join giftify account' }
    end
  end
end
