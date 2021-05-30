require 'rails_helper'

RSpec.describe Superadmin::OrganizationsController, type: :controller do
  let!(:superadmin) { FactoryBot.create(:user) }
  let!(:organization) { FactoryBot.create(:organization) }
  before do
    Role.create(user_id: superadmin.id, organization_id: organization.id, role: Role::SUPERADMIN)
    sign_in superadmin
  end

  describe "GET#index" do
    subject do
      get :index
    end
    it { expect(response).to have_http_status(:success) }
    it { expect(subject).to render_template('index') }
  end
  describe "GET#show" do
    subject do
      get :show, params: {id: organization.id}
    end
    it { expect(response).to have_http_status(:success) }
    it { expect(subject).to render_template('show') }
  end
end
