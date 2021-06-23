require 'rails_helper'

RSpec.describe Account::UserPolicy, type: :policy do
  let(:user) { create(:user, :simple) }
  let(:admin) { create(:user, :admin) }
  let(:manager) { create(:user, :manager) }

  subject { described_class }

  permissions :index? do
    it 'grant access' do
      expect(subject).to permit(user)
    end
  end

  permissions :show? do
    it 'grant access for admin' do
      expect(subject).to permit(admin)
    end

    it 'grant access for manager' do
      expect(subject).to permit(manager)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end
end
