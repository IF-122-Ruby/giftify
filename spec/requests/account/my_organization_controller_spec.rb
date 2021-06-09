require 'rails_helper'

RSpec.describe "Account::MyOrganizations", type: :request do
  let(:admin) { create(:user, :admin) }
  let(:organization) { create(:organization) }

  before { sign_in admin }

  describe "GET #edit" do
    it "returns http success if signed in as admin" do
      get edit_account_my_organization_path(admin)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    let(:organization_params) { attributes_for(:organization, user: organization.user.id) }

    it "organization was updated with valid params" do
      patch account_my_organization_path(organization), params: { organization: organization_params }
      expect(response).to redirect_to(account_gifts_path)
    end
  end
end
