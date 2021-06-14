require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe MonthlyPointsWorker, type: :worker do
  let!(:user)         { create(:user) }
  let!(:organization) { create(:organization, user: user) }

  it 'changes job count' do
    MonthlyPointsWorker.new.perform
    expect(user.balance).to eq 10
  end
end
