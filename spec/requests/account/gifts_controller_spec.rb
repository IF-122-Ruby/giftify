require 'rails_helper'

RSpec.describe Account::GiftsController, type: :request do
  let!(:admin) { create(:user, :admin) }
  let!(:gift) { create(:gift) }

  before do
    sign_in admin
  end

  describe "GET #index" do
    it "returns http success" do
      get account_gifts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get account_gifts_path(gift)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success if signed in as admin" do
      get new_account_gift_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success if signed in as admin" do
      get edit_account_gift_path(gift)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST #create" do
    let(:gift_params) { attributes_for(:gift) }

    it 'creates gift with valid params' do
      post account_gifts_path, params: { gift: gift_params }

      expect(response).to redirect_to(account_gifts_path)
    end

    it 'does not create unit with invalid params' do
      gift_params[:name] = ''
      post account_gifts_path, params: { gift: gift_params }

      expect(response).to redirect_to(new_account_gift_path)
    end
  end

  describe "PATCH #update" do
    let(:gift_params) { attributes_for(:gift) }

    it "returns http success if signed in as admin" do
      patch account_gift_path(gift), params: { gift: gift_params }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "return success if destroy gift" do
      delete account_gift_path(gift)
      expect(response).to have_http_status(:success)
    end
  end
end
