require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  
  describe 'POST #create' do
    let!(:valid_attributes_user) do
      FactoryBot.build(:user).attributes 
    end

    let!(:organization) { FactoryBot.build(:organization).attributes  }
   
    let!(:valid_attributes_organization) do
      valid_attributes_user[:owned_organization_attributes] = organization
      atributes = { user: valid_attributes_user }
      atributes
    end
    
    context "with valid organization and user" do
      it "render registration form with prefilled user data" do
        post user_registration_path, params: valid_attributes_organization

        expect(response.body).to include('Organization name')
      end
    end

    describe "with valid organization and user params" do
      let!(:valid_attributes_with_user_password) do
        valid_attributes_organization[:user].merge!({password: '123456', password_confirmation: '123456'})
        valid_attributes_organization
      end

      it "logining and create persisted and active user" do
        expect do
          post user_registration_path, params: valid_attributes_with_user_password
        end.to change(User, :count).by(1)
      end

      context 'with not active for authentication user' do
        before do
          allow_any_instance_of(User).to receive(:active_for_authentication?).and_return(false)
        end

        it "creates a new organization and user" do
          expect do
            post user_registration_path, params: valid_attributes_with_user_password
          end.to change(User, :count).by(1).and change(Organization, :count).by(1)
        end
      end
    end
  end

  describe 'GET #new' do
    it 'render new' do
      get new_user_registration_path

      expect(response.body).to include('Organization name')
    end
  end
end
