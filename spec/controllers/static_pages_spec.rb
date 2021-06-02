require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  context "GET #home" do
    it "returns a success response" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end
end