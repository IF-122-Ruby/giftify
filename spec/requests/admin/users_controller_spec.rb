require 'rails_helper'

RSpec.describe Admin::UsersController, type: :request do
  let!(:superadmin) { create(:user, :superadmin) }

  before do
    sign_in superadmin
  end

  describe 'GET #index' do
    it "returns http success if signed in as superadmin" do
      get admin_users_path

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns http success status' do
      get admin_user_path(superadmin)

      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'renders edit template' do
      get edit_admin_user_path(superadmin)

      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    let(:user_update_params)     { attributes_for :user }
    let(:edited_user_first_name) { user_update_params[:first_name] }

    it 'shound update user (in this case superadmin)' do
      patch admin_user_path(superadmin), params: { user: user_update_params }

      superadmin.reload
      expect(superadmin.first_name).to eq edited_user_first_name
    end
  end

  describe 'DELETE #destroy' do
    let(:new_user) { create(:user, :simple) }

    before { superadmin.organization.users << new_user }

    it 'should destroy users from organization' do
      expect do
        delete admin_user_path(new_user)
      end.to change(User, :count).by(-1)
    end
  end
end
