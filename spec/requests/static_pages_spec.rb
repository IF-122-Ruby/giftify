require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contact_us/new" do
    it "returns http success" do
      get new_feedback_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /about" do
    it "returns http success" do
      get "/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /pricing" do
    it "returns http success" do
      get "/pricing"
      expect(response).to have_http_status(:success)
    end
  end
end
