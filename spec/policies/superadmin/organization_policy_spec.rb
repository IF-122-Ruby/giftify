require 'rails_helper'

RSpec.describe Superadmin::OrganizationPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user) }
  let(:superadmin) { FactoryBot.create(:user) }
  let(:organization) { FactoryBot.create(:organization) }
  before do
    Role.create(user_id: user.id, organization_id: organization.id)
    Role.create(user_id: superadmin.id, organization_id: organization.id, role: Role::SUPERADMIN)
  end
  subject { described_class }

  permissions :index? do
    it 'grant access' do
      expect(subject).to permit(superadmin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end

  permissions :show? do
    it 'grant access' do
      expect(subject).to permit(superadmin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end
end
