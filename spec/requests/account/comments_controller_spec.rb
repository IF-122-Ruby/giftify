require 'rails_helper'

RSpec.describe "Account::Comments", type: :request do
  let(:admin) { create(:user, :admin) }
  before { sign_in admin }

  describe 'Comment' do
    let(:micropost) { create(:micropost, author: admin, organization: admin.organization) }
    let(:comment_params) { { comment: { micropost_id: micropost.id, body: "Hello" } } }
    let(:invalid_params) { { comment: { micropost_id: micropost.id, body: "" } } }
    
    it 'add comment to micropost' do
      post account_comments_path(micropost: micropost), params: comment_params, xhr: true
      get account_microposts_path
      expect(response.body).to match /<p class="text-justify comment-text mb-0">Hello/
    end

    it 'invalid comment didn`t save' do
      expect(Comment.count).to eq(0)
      post account_comments_path(micropost: micropost), params: invalid_params, xhr: true
      expect(Comment.count).to eq(0)
    end

    it 'valid comment save in db' do
      expect(Comment.count).to eq(0)     
      expect do        
        post account_comments_path(micropost: micropost), params: comment_params, xhr: true
      end.to change(Comment, :count).by(1)
    end
  end
end

