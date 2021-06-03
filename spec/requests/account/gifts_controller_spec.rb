require 'rails_helper'

RSpec.describe Account::GiftsController, type: :request do
  let(:admin) { create(:user, :admin) }

  before do
    sign_in admin
  end

  describe "gifts" do
    it "returns http success if signed in as admin" do
      get '/account/gifts'
      expect(response).to have_http_status(:success)
    end
  end
end