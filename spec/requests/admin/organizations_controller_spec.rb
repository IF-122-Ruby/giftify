require 'rails_helper'

RSpec.describe Admin::OrganizationsController, type: :request do
  let(:superadmin) { FactoryBot.create(:user, :with_superadmin_role) }

  before { sign_in superadmin }

  describe "organizations" do
    it "returns http success if signed in as superadmin" do
      get '/admin/organizations'
      expect(response).to have_http_status(:success)
    end
  end
end
