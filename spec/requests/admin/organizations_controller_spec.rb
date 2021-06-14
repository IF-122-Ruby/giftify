require 'rails_helper'

RSpec.describe Admin::OrganizationsController, type: :request do
  let(:superadmin) { create(:user, :superadmin) }
  let(:organization) { create(:organization) }
  before { sign_in superadmin }

  describe "organizations" do
    it "returns http success if signed in as superadmin" do
      get '/admin/organizations'
      expect(response).to have_http_status(:success)
    end

    it "Must render admin/organizations/show" do
      get admin_organization_path(organization)
      expect(response).to have_http_status(:success)
    end
  end
end
