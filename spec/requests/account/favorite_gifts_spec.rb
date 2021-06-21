require 'rails_helper'

RSpec.describe "FavoriteGifts", type: :request do
  describe "GET #index" do
    it "returns http success" do
      get account_favorite_gifts_path
      expect(response).to have_http_status(:success)
    end
  end
end
