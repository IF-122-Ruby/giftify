require 'rails_helper'

RSpec.describe Account::UsersController, type: :request do
  let(:admin)          { create(:user, :admin) }
  let(:admin_id)       { admin.id }
  let(:new_admin_name) { Faker::Name.first_name }
  let(:user_params)    { { user: { first_name: new_admin_name, last_name:  'Last name Admin' } } }
  let(:new_user)       { create(:user, :admin) }

  before do
    sign_in admin
  end

  describe "users" do
    
    it "returns http success if signed in as admin" do
      get '/account/users'

      expect(response).to have_http_status(:success)
    end

    it '#show' do
      get "/account/users/#{admin.id}"

      expect(response).to have_http_status(:success)
    end

    it '#update' do
      patch "/account/users/#{admin.id}", params: user_params

      admin.reload
      expect(admin.first_name).to eql new_admin_name
    end

    it '#destoy' do
      admin.organization.users << new_user 

      expect do
        delete "/account/users/#{new_user.id}"
      end.to change(User, :count).by(-1)
    end
  end
end
