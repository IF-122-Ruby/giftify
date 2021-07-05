require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  let(:organization) { create(:organization) }
  let(:user) { create(:user, organization: organization) }
  let!(:transaction) { create(:transaction, receiver: user, sender: organization, amount: 100) }

  describe 'GET #show' do
    it 'return user by token' do
      get api_v1_user_path, headers: { 'token': user.token }
      response_json = JSON.parse(response.body)
      
      expect(response_json['balance']).to eq(user.balance)
    end

    it 'return :not_found by invalid token' do
      get api_v1_user_path, headers: { 'token': user.token + 'balance'}

      expect(response).to have_http_status(404)
    end
  end
end
