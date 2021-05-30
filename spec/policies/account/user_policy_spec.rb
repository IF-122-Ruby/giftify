require 'rails_helper'

RSpec.describe Account::UserPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user) }
  let(:organization) { FactoryBot.create(:organization) }
  subject { described_class }

  permissions :index? do
    before do
      Role.create(user_id: user.id, organization_id: organization.id)
    end

    it 'grant access' do
      expect(subject).to permit(user)
    end
  end

  permissions :show? do
    before do
      Role.create(user_id: user.id, organization_id: organization.id)
      Role.create(user_id: admin.id, organization_id: organization.id, role: Role::ADMIN)
    end
    it 'grant access' do
      expect(subject).to permit(admin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end
end
