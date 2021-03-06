require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /posts' do
    context 'with category name params' do
      let(:category) { create(:category) }

      it 'returns published posts for specific category' do
        get posts_path, params: { category_name: category.name }

        expect(response).to be_successful
      end
    end

    context 'without category name params' do
      it 'returns all published posts' do
        get posts_path

        expect(response).to be_successful
      end
    end
  end

  describe 'GET /posts/:id' do
    let(:post) { create(:post, :with_image, published_at: Time.zone.now - 10.minutes) }

    it 'returns specific post by id' do
      get post_path(post)

      expect(response).to be_successful
    end
  end
end
