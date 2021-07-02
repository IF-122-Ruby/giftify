require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe MonthlyBalanceMailWorker, type: :worker do
  let!(:user)  { create(:user) }

  it 'checks deliveries count' do
    expect do
      MonthlyBalanceMailWorker.new.perform
    end.to change { ApplicationMailer.deliveries.count }.by(1)  
  end
end
