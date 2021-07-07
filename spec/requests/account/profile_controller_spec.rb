require 'rails_helper'

RSpec.describe 'Account::Profile', type: :request do
  let!(:user) { create(:user, :simple, first_name: 'John') }

  before { sign_in user }

  describe 'GET #edit' do
    it 'returns http success if signed in as user John' do
      expect(user.first_name).to eq('John')
      get edit_account_profile_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH #update' do
    let(:user_update) { attributes_for(:user, first_name: 'Bob') }

    it 'user was renamed as Bob' do
      patch account_profile_path, params: { user: user_update }
      expect(user.first_name).to eq('Bob')
      expect(response).to redirect_to(edit_account_profile_path)
    end
  end

  describe 'PATCH #update' do
    it 'user can not be renamed to invalid value' do
      patch account_profile_path, params: {
        user: {
          first_name: ''
        }
      }
      expect(user.reload.first_name).not_to eq('')
      expect(response.body).to include('Wrong input data. Profile wasn`t updated')
    end
  end
end
