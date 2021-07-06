require 'rails_helper'

RSpec.describe Account::ArticlesController, type: :request do
  let!(:organization) { create(:organization) }
  let!(:admin) { create(:user, :admin, organization: organization) }
  let!(:article) { create(:article, organization: organization) }

  before do
    sign_in admin
  end

  describe "GET #index" do
    it "returns http success" do
      get account_articles_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get account_articles_path(article)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success if signed in as admin" do
      get new_account_article_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success if signed in as admin" do
      get edit_account_article_path(article)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:article_params) { attributes_for(:article) }
    let(:invalid_article_params) { { article: { body: "  ", title: "" } } }
    it 'creates article with valid params' do
      post account_articles_path, params: { article: article_params }
      expect(response).to redirect_to(account_articles_path)
    end

    it 'does not create unit with invalid params' do
      expect(Article.count).to eq(1)     
      expect do        
        post account_articles_path, params: { article: invalid_article_params }
        expect(response.body).to match /Invalid article/
      end.to change(Article, :count).by(0)
    end
  end

  describe "PATCH #update" do
    let(:article_params) { attributes_for(:article) }

    it "returns http success if signed in as admin" do
      patch account_article_path(article), params: { article: article_params }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE #destroy" do
    it "return success if destroy article" do
      delete account_article_path(article)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE #destroy" do
    it "deletes article" do
      expect do
        delete account_article_path(article)
      end.to change(Article, :count).by(-1) 
    end
  end
end
