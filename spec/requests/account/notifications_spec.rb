require 'rails_helper'

RSpec.describe "Account::Notifications", type: :request do
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user, organization: organization) }
  let!(:notification) { create(:notification, user: user)}

  before { sign_in user }

  describe "GET /notifications" do
    it "include user notification" do
      get account_notifications_path

      expect(response.body).to include(notification.message)
    end
  end

  describe "POST /mark_all_as_read" do
    it "mark notification as read" do
      post mark_all_as_read_account_notification_path(id: notification.id)
      expect(notification.reload.read).to be_truthy

      get account_notifications_path
      expect(response.body).not_to match /<div class="text-primary notifications__mark"/
    end
  end
end
