require 'rails_helper'

RSpec.describe Admin::OrganizationsController, type: :controller do
  let!(:superadmin) { FactoryBot.create(:user) }
  before { sign_in superadmin }
  describe "GET#index" do
    subject do
      get :index
    end
    it { expect(response).to have_http_status(:success) }
  end
  describe "GET#show" do
    subject do
      get :show, params: {id: organization.id}
    end
    it { expect(response).to have_http_status(:success) }
  end
end
