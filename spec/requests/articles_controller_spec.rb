require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let!(:superadmin) { create(:user, :superadmin) }
  let!(:article) { create(:article) }

  before do
    sign_in superadmin
  end

  describe "GET #help" do
    it "correct page" do
      get help_path
      expect(response.body).to match /<CENTER> Hello/
    end
  end

  describe "GET #edit" do
    it "returns http success if signed in as admin" do
      get edit_article_path(article)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    let(:article_params) { attributes_for(:article, page_name: 'help') }
    it "article page_name was changed" do
      patch article_path(article), params: { article: article_params }
      expect(article.page_name).to eq('help')
      expect(response).to redirect_to(help_path)
    end
  end
end
