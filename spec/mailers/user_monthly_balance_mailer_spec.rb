require "rails_helper"
require 'sidekiq/testing'

RSpec.describe UserMonthlyBalanceMailer, type: :mailer do
  let!(:user)  { create(:user) }
  let!(:mail)  { UserMonthlyBalanceMailer.balance_email(user) }

  it 'checks deliveries count' do
    expect(mail.subject).to eq("Your current balance on Giftify") 
  end
end