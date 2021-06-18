require 'rails_helper'

RSpec.describe Account::InvitesController, type: :controller do

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

end