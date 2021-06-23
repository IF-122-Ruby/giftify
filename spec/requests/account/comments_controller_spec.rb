require 'rails_helper'

RSpec.describe "Account::Comments", type: :request do
  let(:admin) { create(:user, :admin) }
  before { sign_in admin }

  describe 'Comment' do
  let(:micropost) { create(:micropost, author: admin, organization: admin.organization) }
  let(:comment_params) { { comment: { micropost: micropost, micropost_id: micropost.id, body: "Hello" } } }
    it 'add comment to micropost' do
      post account_comments_path(micropost: micropost), params: comment_params, xhr: true
      get account_microposts_path
      expect(response.body).to match /<p class="text-justify comment-text mb-0">Hello/
    end
  end
end
