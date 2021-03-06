require 'rails_helper'

RSpec.describe "Feedbacks", type: :request do
  describe "POST /contact_us" do
    it "go to /contact_us, create feedback and redirect to root with notice" do
      feedback_params = attributes_for :feedback
      get new_feedback_path
      expect(response).to have_http_status(:success)

      post feedback_path, params: { feedback: feedback_params }
      expect(response).to redirect_to(root_path)
      follow_redirect!

      expect(response).to have_http_status(:success)
      expect(response.body).to include("#{feedback_params[:name]}, thank you for your feedback. The administration will contact you shourtly.")
    end
  end
end
