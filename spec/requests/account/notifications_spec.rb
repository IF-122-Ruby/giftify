require 'rails_helper'

RSpec.describe "Account::Notifications", type: :request do
  let!(:user) { create(:user) }
  let!(:notification) { create(:notification, user: user)}

  before { sign_in user }

  describe "GET /notifications" do
    it "returns http success" do
      get account_notifications_path

      expect(response.body).to include(notification.message)
    end
  end
end
