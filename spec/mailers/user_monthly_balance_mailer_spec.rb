require "rails_helper"
require "sidekiq/testing"

RSpec.describe UserMonthlyBalanceMailer, type: :mailer do

  describe "balance mailer" do
    let!(:user)  { create(:user, :with_organization) }
    let!(:transaction) { create(:transaction, receiver: user, sender: user.organization, amount: 100) }
    let!(:mail)  { UserMonthlyBalanceMailer.balance_email(user) }
    
    it "checks deliveries count" do
      expect(mail.subject).to eq("Your current balance on Giftify")
      expect(mail.body.encoded).to include("Your current balance on Giftify is: #{user.balance} points! Do not forget to buy something cool ;)")
    end
  end
end

