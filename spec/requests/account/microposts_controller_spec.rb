require 'rails_helper'

RSpec.describe Account::MicropostsController, type: :request do
  let(:micropost) { create(:micropost) }
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
      get new_account_micropost_path, xhr: true

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let!(:micropost_params) { attributes_for(:micropost) }
    it 'creates micropost with valid params' do
      expect(Micropost.count).to eq(1)     
      expect do        
        post account_microposts_path, params: { micropost: micropost_params }, xhr: true
      end.to change(Micropost, :count).by(1)
    end

    it 'does not create micropost with invalid params' do
      micropost_params[:title] = ''
      expect(Micropost.count).to eq(1)     
      expect do        
        post account_microposts_path, params: { micropost: micropost_params }, xhr: true
      end.to change(Micropost, :count).by(0)
    end
  end

  describe 'PATCH #update' do
    let(:micropost_update_params)     { attributes_for :micropost }
    let(:edited_micropost_title) { micropost_update_params[:title] }

    it 'shound update micropost' do
      patch account_micropost_path(micropost), params: { micropost: micropost_update_params }, xhr: true

      micropost.reload
      expect(micropost.title).to eq edited_micropost_title
    end
  end

  describe "DELETE #destroy" do
    it "return success if destroy micropost" do
      delete account_micropost_path(micropost)
      expect(response).to have_http_status(:redirect)
    end
  end
end
