require 'rails_helper'

RSpec.describe Admin::BasePolicy, type: :policy do
  let(:user) { create(:user, :simple) }
  let(:superadmin) { create(:user, :superadmin) }
  
  subject { described_class }

  permissions :require_superadmin? do
    it 'grant access' do
      expect(subject).to permit(superadmin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end
end
