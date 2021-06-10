require 'rails_helper'

RSpec.describe Account::OrganizationPolicy, type: :policy do
  let(:user) { create(:user, :simple) }
  let(:admin) { create(:user, :admin) }

  subject { described_class }

  permissions :edit? do
    it 'grant access' do
      expect(subject).to permit(admin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end

  permissions :update? do
    it 'grant access' do
      expect(subject).to permit(admin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end
end
