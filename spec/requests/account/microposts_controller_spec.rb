require 'rails_helper'

RSpec.describe Account::MicropostsController, type: :request do
  let!(:micropost) { create(:micropost) }
  before do
    sign_in micropost.author
  end

  describe "GET #index" do
    it "returns http success" do
      get account_microposts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success if signed in as admin" do
      get new_account_micropost_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:micropost_params) { attributes_for(:micropost) }

    it 'creates micropost with valid params' do
      post account_microposts_path, params: { micropost: micropost_params }

      expect(response).to redirect_to(account_microposts_path)
    end

    it 'does not create unit with invalid params' do
      micropost_params[:title] = ''
      post account_microposts_path, params: { micropost: micropost_params }

      expect(response.body).to match /Wrong input data. Micropost wasn`t created/
    end
  end

  describe "PATCH #update" do
    let(:micropost_params) { attributes_for(:micropost) }

    it "returns http success if signed in as admin" do
      patch account_micropost_path(micropost), params: { micropost: micropost_params }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE #destroy" do
    it "return success if destroy micropost" do
      delete account_micropost_path(micropost)
      expect(response).to have_http_status(:redirect)
    end
  end
end
