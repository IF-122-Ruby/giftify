require 'rails_helper'

RSpec.describe "OrganizationGifts", type: :request do
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user, organization: organization) }
  let!(:gift) { create(:gift, :with_image, organization: organization) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get account_organization_gifts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get account_organization_gift_path(gift)
      expect(response).to have_http_status(:success)
    end
  end
end
