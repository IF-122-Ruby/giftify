require 'rails_helper'

RSpec.describe Account::GiftPolicy, type: :policy do
  let(:user) { create(:user, :simple) }
  let(:admin) { create(:user, :admin) }
  subject { described_class }

  permissions :index? do
    it 'grant access' do
      expect(subject).to permit(user)
    end
  end

  permissions :show? do
    it 'grant access' do
      expect(subject).to permit(user)
    end
  end

  permissions :new? do
    it 'grant access' do
      expect(subject).to permit(admin)
    end

    it 'denied access' do
      expect(subject).not_to permit(user)
    end
  end

end
