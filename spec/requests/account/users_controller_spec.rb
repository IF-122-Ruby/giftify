require 'rails_helper'

RSpec.describe Account::UsersController, type: :request do
  let!(:admin) { create(:user, :admin) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it "returns http success if signed in as admin" do
      get account_users_path

      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns http success status' do
      get account_user_path(admin)

      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'renders edit template' do
      get edit_account_user_path(admin)

      expect(response).to be_successful 
    end
  end

  describe 'PATCH #update' do
    let(:new_admin_name) { Faker::Name.first_name }
    let(:user_params)    { { user: { first_name: new_admin_name, last_name:  'Last name Admin' } } }

    it 'shound update user (in this case admin)' do
      patch account_user_path(admin), params: user_params

      admin.reload
      expect(admin.first_name).to eq new_admin_name
    end
  end


  describe 'DELETE #destroy' do
    let(:new_user) { create(:user, :simple) }

    before { admin.organization.users << new_user }

    it 'should destroy users from admin`s organization' do
      expect do
        delete account_user_path(new_user)
      end.to change(User, :count).by(-1)
    end
  end
end
