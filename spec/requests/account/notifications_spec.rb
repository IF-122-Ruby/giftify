require 'rails_helper'

RSpec.describe "Account::Notifications", type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET /notifications" do
    it "returns http success" do
      get account_notifications_path
      

      expect(response).to have_http_status(:success)
    end
  end
end
