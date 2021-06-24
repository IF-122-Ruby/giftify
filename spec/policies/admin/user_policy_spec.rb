require 'rails_helper'

RSpec.describe Admin::UserPolicy, type: :policy do
  let(:user) { create(:user, :simple) }
  let(:superadmin) { create(:user, :superadmin) }

  subject { described_class }

  permissions :index? do
    it 'grant access' do
      expect(subject).to permit(user)
    end
  end

  permissions :show? do
    it 'grant access for superadmin' do
      expect(subject).to permit(superadmin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end
end
