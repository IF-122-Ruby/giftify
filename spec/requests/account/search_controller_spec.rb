require 'rails_helper'

RSpec.describe Account::SearchController, type: :request do
  let!(:user) { create(:user, :with_organization, first_name: 'John') }

  before do
    User.__elasticsearch__.import
    Gift.__elasticsearch__.import

    sleep 1

    sign_in user
  end

  describe "GET /search" do
    it 'find user' do
      get account_search_path(search: '*')
      follow_redirect!
      expect(response).to be_successful
    end
  end
end
