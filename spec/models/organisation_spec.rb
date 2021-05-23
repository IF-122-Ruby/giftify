require 'rails_helper'

RSpec.describe Organisation, type: :model do
  let(:organisation) { Organisation.new(name: 'Name', creator_id: 1, monthly_point: 100, logo: 'logo.jpg')}

  it 'is valid with correct data' do
    expect(organisation.valid?).to be_truthy
  end

  it 'is invalid with incorrect data' do
    # validates in model should reject nil in fields creator_id, monthly_point
    organisation.creator_id = nil
    expect(organisation.invalid?).to be_truthy
    organisation.creator_id = 1
    organisation.monthly_point = nil
    expect(organisation.invalid?).to be_truthy
  end
end
