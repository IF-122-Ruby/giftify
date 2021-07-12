require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :request do
  describe 'Sign In user with Google' do
    let!(:organization) { create(:organization) }
    let!(:user) { create(:user, organization: organization) }

    describe 'GET #google_oauth2' do
      before do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: 'google_oauth2',
          uid: '107474126175461691576',
          info: {
            email: email,
            first_name: 'Steve',
            last_name: 'Jobs'
          }
        })
      end

      context 'with not existing user' do
        let(:email) { 'giftify@gmail.com' }

        it 'redirect to registration page when user not persisted' do
          post user_google_oauth2_omniauth_callback_path

          expect(response).to redirect_to(new_user_registration_path)
          follow_redirect!
          expect(response.body).to include('Create new account')
        end
      end

      context 'with not existing user' do
        let(:email) { user.email }

        it 'logining user and redirect on root page' do
          post user_google_oauth2_omniauth_callback_path
  
          expect(response).to redirect_to(root_path)
          follow_redirect!
          expect(response.body).to include('Giftify')
        end
      end
    end
  end
end
