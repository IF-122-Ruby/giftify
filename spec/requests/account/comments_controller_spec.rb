require 'rails_helper'

RSpec.describe "Account::Comments", type: :request do
  let(:admin) { create(:user, :admin) }
  before { sign_in admin }

  describe 'Comment' do
    let(:micropost) { create(:micropost, author: admin, organization: admin.organization) }
    let(:gift) { create(:gift, :with_image, organization: admin.organization) }
    let(:comment_params) { { comment: { body: "Hello" } } }
    let(:invalid_params) { { comment: { body: "" } } }

    context 'add comment' do
      it 'to micropost' do
        post account_micropost_comments_path(micropost.id), params: comment_params, xhr: true
        get account_microposts_path
        expect(response.body).to match /<p class=\"text-right comment-text mb-0\">Hello/
      end

      it 'to gift' do
        post account_gift_comments_path(gift.id), params: comment_params, xhr: true
        get account_organization_gift_path(gift)
        expect(response.body).to match /<p class=\"text-right comment-text mb-0\">Hello/
      end
    end

    it 'invalid comment didn`t save' do
      expect(Comment.count).to eq(0)
      post account_micropost_comments_path(micropost.id), params: invalid_params, xhr: true
      post account_gift_comments_path(gift_id: gift.id), params: invalid_params, xhr: true
      expect(Comment.count).to eq(0)
    end

    it 'valid comment save in db' do
      expect(Comment.count).to eq(0)
      expect do
        post account_micropost_comments_path(micropost.id), params: comment_params, xhr: true
        post account_gift_comments_path(gift_id: gift.id), params: comment_params, xhr: true
      end.to change(Comment, :count).by(2)
    end

    it 'remove comment from micropost' do
      post account_micropost_comments_path(micropost.id), params: comment_params, xhr: true
      get account_microposts_path
      expect(response.body).to match /<p class=\"text-right comment-text mb-0\">Hello/
      expect(Comment.count).to eq(1)

      delete account_comment_path(micropost.comments.first), xhr: true
      expect(response.body).to include("Comment successfully deleted")
      expect(Comment.count).to eq(0)

      get account_microposts_path
      expect(response.body).not_to match /<p class=\"text-right comment-text mb-0\">Hello/
    end

    it 'remove comment from gift' do
      post account_gift_comments_path(gift.id), params: comment_params, xhr: true
      get account_organization_gift_path(gift)
      expect(response.body).to match /<p class=\"text-right comment-text mb-0\">Hello/
      expect(Comment.count).to eq(1)

      delete account_comment_path(gift.comments.first), xhr: true
      expect(response.body).to include("Comment successfully deleted")
      expect(Comment.count).to eq(0)

      get account_organization_gift_path(gift)
      expect(response.body).not_to match /<p class=\"text-right comment-text mb-0\">Hello/
    end
  end
end
