require 'rails_helper'

RSpec.describe Api::V1::MyGiftsController, type: :request do
  let!(:organization) { create(:organization) }
  let!(:user) { create(:user, organization: organization) }
  let!(:my_gift) { create(:gift, :with_image, organization: organization, name: 'Jones, Osinski and Murphy', price: 59) }

  describe 'GET #index' do
    it 'return user gifts by token' do
      get api_v1_my_gifts_path, headers: { 'Authorization': "Bearer #{user.token}" }
      response_json = JSON.parse(response.body)
      
      expect(response_json['my_gifts']).to eq(user.my_gifts)
    end

    it 'return :not_found by invalid token' do
      get api_v1_my_gifts_path, headers: { 'Authorization': "Bearer #{user.token} my gifts"}

      expect(response).to have_http_status(401)
    end
  end

  describe 'GET #show' do
    let!(:transaction) { create(:transaction, receiver: my_gift, sender: user, amount: my_gift.price) }

    it 'returns http success' do
      get api_v1_my_gift_path(my_gift), headers: { 'Authorization': "Bearer #{user.token}" }
      response_json = JSON.parse(response.body)
      
      expect(response_json['my_gift']['name']).to include(my_gift.name)
    end
  end
end
