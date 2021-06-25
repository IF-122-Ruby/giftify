require 'rails_helper'

RSpec.describe "Account::Reactions", type: :request do
  let(:admin) { create(:user, :admin) }
  let(:micropost) { create(:micropost, author: admin, organization: admin.organization) }
  let(:reaction_attribute) { attributes_for(:reaction, micropost: micropost, id: micropost.id) }

  before { sign_in admin }

  describe 'reaction' do
    it 'add and remove reaction to micropost' do
      post account_reactions_path(reaction_attribute), xhr: true
      get account_microposts_path

      expect(response.body).to include("#{Reaction::LAUGH} 1")

      delete account_reaction_path(reaction_attribute), xhr: true
      get account_microposts_path
      expect(response.body).to include(Reaction::LAUGH)
    end
  end
end
