require 'rails_helper'

RSpec.describe Account::UserPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user, :with_user_role) }
  let(:admin) { FactoryBot.create(:user, :with_admin_role) }
  subject { described_class }

  permissions :index? do
    it 'grant access' do
      expect(subject).to permit(user)
    end
  end

  permissions :show? do
    it 'grant access' do
      expect(subject).to permit(admin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end
end
