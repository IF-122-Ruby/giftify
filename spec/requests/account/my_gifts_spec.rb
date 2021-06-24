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
end
