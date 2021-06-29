require 'rails_helper'

RSpec.describe AcceptInvitesController, type: :request do
  let!(:user) { create(:user) }
  let!(:invite) { create(:invite, recipient_role: :manager) }

    describe "GET #new" do
      it 'returns success status' do
        get new_accept_invite_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST #create" do
      it 'changes user count by 1 if given params valid' do
        expect do
          post accept_invites_path, params: {
            user: {
              token: invite.invite_token,
              email: invite.recipient_email,
              role: invite.recipient_role,
              first_name: 'Han',
              last_name: 'Solo',
              password: 'Sesam123',
              password_confirmation: 'Sesam123'
            }
          }
      end.to change(User, :count).by(1)
    end
  end
end
