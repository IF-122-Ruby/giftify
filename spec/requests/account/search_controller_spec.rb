require 'rails_helper'

RSpec.describe Account::SearchController, type: :request do
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user, :simple, organization: organization) }

  before { sign_in user }

  describe "GET /search" do
    it 'find user' do
      get account_search_path(search: user.first_name)
      expect(response.body).to be_successful
    end
  end
end
