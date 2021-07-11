require 'rails_helper'

RSpec.describe Admin::ArticlesController, type: :request do
  let!(:superadmin) { create(:user, :superadmin) }
  let!(:article) { create(:article, :help_page) }

  before do
    sign_in superadmin
  end

  describe "GET #edit" do
    it "returns http success if signed in as superadmin" do
      get edit_admin_article_path(article)
      expect(response).to render_template(:edit)
      expect(response.body).to include("Update page")
    end
  end

  describe "PATCH help#update" do
    let(:article_params) { attributes_for(:article, page_name: 'help') }
    it "article page_name was changed" do
      patch admin_article_path(article), params: { article: article_params }
      expect(article.page_name).to eq('help')
      expect(response).to redirect_to("/#{article.page_name}")
      follow_redirect!
      expect(response.body).to include("<div class=\"alert alert-info\">Article was successfully updated.</div>")
    end
  end
end
