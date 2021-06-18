require 'rails_helper'

RSpec.describe Account::InvitesController, type: :request do
  let!(:organization) { create(:organization) }
  let!(:admin) { create(:user, :admin, organization: organization) }
  let!(:invite) { create(:invite, organization: organization) }

  before { sign_in admin }

  describe "GET #index" do
    it "returns http success" do
      get account_invites_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success if signed in as admin" do
      get account_invites_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:invite_params) { attributes_for(:invite) }

    it "creates invite with valid params" do
      post account_invites_path, params: { invite: invite_params }

      expect(response).to redirect_to(account_invites_path)
    end

  end

  describe "render email views" do
    let(:invite_params) { attributes_for(:invite) }

    it "render email from invitation" do
      post account_invites_path, params: { invite: invite_params }
      expect(response.body).to match /Invitation to Giftify organization/
    end
  end
end