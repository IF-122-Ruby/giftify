require 'rails_helper'

RSpec.describe 'Account::MyGifts', type: :request do
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user, organization: organization) }
  let!(:my_gift) { create(:gift, :with_image, organization: organization, name: 'Jones, Osinski and Murphy', price: 59) }

  before do
    sign_in user
  end

  describe 'GET /my_gifts' do
    it 'returns http success' do
      get account_my_gifts_path

      expect(response).to render_template :index
    end
  end

  describe 'GET /my_gifts/:id' do
    let!(:transaction) { create(:transaction, receiver: my_gift, sender: user, amount: my_gift.price) }

    it 'returns http success' do
      get account_my_gift_path(my_gift)

      expect(response.body).to include my_gift.name
    end
  end

  describe "POST /my_gifts/:id/receive" do
    let!(:gift) { create(:gift, :with_image, organization: organization, name: 'Toy and Sons', price: 19) }

    it 'successfully added gift' do
      allow(user).to receive(:balance).and_return(100)
      post receive_account_my_gift_path(id: gift.id), xhr: true
      get account_my_gift_path

      expect(response.body).to include gift.name
    end

    it 'failed to add gift if balance is zero' do
      allow(user).to receive(:balance).and_return(0)
      post receive_account_my_gift_path(id: gift.id), xhr: true

      expect(response.body).to include "There are not enough points on your balance"

      get account_my_gifts_path
      expect(response.body).not_to include gift.name
    end

    it 'failed to add gift if gift`s amount is equal zero' do
      allow(user).to receive(:balance).and_return(100)
      gift.update!(amount: 0)

      post receive_account_my_gift_path(id: gift.id), xhr: true

      expect(response.body).to include "The gifts are over"
    end
  end
end
