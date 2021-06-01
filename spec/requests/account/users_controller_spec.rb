require 'rails_helper'

RSpec.describe Account::UsersController, type: :request do
  let(:admin) { FactoryBot.create(:user, :admin) }

  before do
    sign_in admin
  end

  describe "users" do
    it "returns http success if signed in as admin" do
      get '/account/users'
      expect(response).to have_http_status(:success)
    end
  end
end
