require 'rails_helper'

RSpec.describe Account::TransactionController, type: :request do
  let!(:user) { create(:user) }
  let!(:telegram_profile) { create(:telegram_profile) }

  before { sign_in user }

  describe '/telegram_profile/connect' do
    it 'create connection to telegram' do
      get account_telegram_profile_connect_path(connection_token: telegram_profile.connection_token)
      expect(response).to have_http_status(:redirect)
      follow_redirect!
      expect(response.body).to include('You`re connected to telegram')
    end

    it 'doesn`t create connection to telegram' do
      get account_telegram_profile_connect_path(connection_token: telegram_profile.connection_token + 'n')
      expect(response).to have_http_status(:redirect)
      follow_redirect!
      expect(response.body).to include('You aren`t connected to telegram')
    end
  end
end
