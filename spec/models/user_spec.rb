require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(first_name: 'Name', last_name: 'Surname', email: 'test@gmail.com')}

  it 'is invalid with incorrect data' do
    expect(user.invalid?).to be_truthy
  end

  it 'is valid with correct data' do
    user.password = '123456'

    expect(user.valid?).to be_truthy
  end
end
