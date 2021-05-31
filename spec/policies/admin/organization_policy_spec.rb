require 'rails_helper'

RSpec.describe Admin::BasePolicy, type: :policy do
  let(:user) { FactoryBot.create(:user) }
  subject { described_class }

  permissions :index? do
    it 'grant access' do
      expect(subject).to permit(user)
    end

    # it 'denied access' do
    #   expect(subject).not_to permit(user)
    # end
  end

  permissions :show? do
    it 'grant access' do
      expect(subject).to permit(superadmin)
    end

    # it 'denied access' do
    #   expect(subject).not_to permit(user)
    # end
  end
end
