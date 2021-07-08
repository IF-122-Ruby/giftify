require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let!(:superadmin) { create(:user, :superadmin) }
  let!(:article) { create(:article) }

  before do
    sign_in superadmin
  end

  describe "GET #help" do
    it "returns http success" do
      get help_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success if signed in as admin" do
      get edit_article_path(article)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    let(:article_params) { attributes_for(:article) }

    it "returns http success if signed in as admin" do
      patch article_path(article), params: { article: article_params }
      expect(response).to have_http_status(:redirect)
    end
  end
end
