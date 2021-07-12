require "rails_helper"

RSpec.describe FeedbacksChannel, type: :channel do
  let!(:feedback) { create(:feedback) }

  it "successfully subscribes" do
    subscribe feedback: feedback
    expect(subscription).to be_confirmed
  end
end
