require 'rails_helper'

RSpec.describe Account::SearchController, type: :request do
  let!(:user) { create(:user, :with_organization, first_name: 'John') }
  let!(:gift) { create(:gift, :with_image, organization: user.organization)}

  before do
    create_list(:user, 10, organization: user.organization)
    create_list(:gift, 10, :with_image, organization: user.organization)
    User.__elasticsearch__.import
    Gift.__elasticsearch__.import
    
    sleep 1

    sign_in user
  end

  describe "GET /search" do
    it 'find user' do
      get account_search_path(search: user.first_name)
      expect(response.body).to include(user.first_name)
    end

    it 'find gift' do
      get account_search_path(search: gift.name)
      expect(response.body).to include(gift.name.split[0])
    end

    it 'doesn`t find anything' do
      get account_search_path(search: 'random name')
      expect(response.body).to include('There are no results')
    end

    it 'doesn`t search blank query' do
      get account_search_path(search: '')
      expect(response.body).to include('There are no results')
    end

    it 'return multiple results' do
      user.organization.users.second.update(first_name: 'John')
      get account_search_path(search: user.first_name)
      expect(response.body).to include(user.first_name).twice
    end
  end
end
