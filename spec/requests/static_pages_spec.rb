require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end

    it "have correct title" do
      get "/"
      expect(response.body).to match /<title> Giftify | Home/
    end
  end

  describe "GET /contact_us/new" do
    it "returns http success" do
      get new_feedback_path
      expect(response).to have_http_status(:success)
    end

    it "have correct title" do
      get new_feedback_path
      expect(response.body).to match /<title> Giftify | Feedback/
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/about"
      expect(response).to have_http_status(:success)
    end

    it "have correct title" do
      get "/about"
      expect(response.body).to match /<title> Giftify | About us/
    end
  end

  describe "GET /pricing" do
    it "returns http success" do
      get "/pricing"
      expect(response).to have_http_status(:success)
    end

    it "have correct title" do
      get "/pricing"
      expect(response.body).to match /<title> Giftify | Pricing/
    end
  end
end
