require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contact_us" do
    it "returns http success" do
      get "/contact_us"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /contact_us" do
    it "go to /contact_us, create feedback and redirect to home with notice" do
      feedback_params = { feedback: {
        name: "Sam Tudor",
        email: "samdor@mail.com",
        reason: "Want to talk",
        subject: "Hello admin",
        message: "Lorem ipsum dolor"
      }}

      get "/contact_us"
      expect(response).to have_http_status(:success)

      post "/contact_us", params: feedback_params
      expect(response).to redirect_to(:root)
      follow_redirect!

      expect(response).to have_http_status(:success)
      expect(response.body).to include("Sam Tudor, thank you for your feedback. The administration will contact you shourtly.")
    end
  end
end
