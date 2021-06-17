require 'rails_helper'

RSpec.describe "Sitemaps", type: :request do
  describe "GET /sitemaps" do
    it "returns http success" do
      get "/sitemaps"
      expect(response).to have_http_status(:success)
    end
  end
end
