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
      get new_account_invite_path
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

  describe "DELETE #destroy" do
    it 'deletes invite' do
      expect do
        delete account_invite_path(invite)
      end.to change(Invite, :count).by(-1)  
    end
  end
end
