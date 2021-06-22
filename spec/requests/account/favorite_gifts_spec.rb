require 'rails_helper'

RSpec.describe "FavoriteGifts", type: :request do
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user, organization: organization) }
  let!(:gift) { create(:gift, :with_image, organization: organization, name: 'Cup') }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get account_favorite_gifts_path
      expect(response).to have_http_status(:success)
    end

    it "displays the gift name" do
      expect(gift.name).to eq('Cup')
    end
  end
end
