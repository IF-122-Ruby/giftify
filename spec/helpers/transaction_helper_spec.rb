require 'rails_helper'

RSpec.describe TransactionHelper do
  let!(:user) { create(:user, :simple, :with_organization, first_name: 'John') }

  before { sign_in user }

  describe 'user collection of current organization' do
    it 'returns array with current user`s colleagues' do
      expect(helper.user_collection_of_current_organization).to be_an_instance_of(Array)
    end
  end
end
