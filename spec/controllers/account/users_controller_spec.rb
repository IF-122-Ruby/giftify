require 'rails_helper'

RSpec.describe Account::UsersController, type: :controller do
  let!(:admin) { FactoryBot.create(:user) }
  let!(:organization) { FactoryBot.create(:organization) }
  before do
    Role.create(user_id: admin.id, organization_id: organization.id, role: Role::ADMIN)
    sign_in admin
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
      get :show, params: {id: admin.id}
    end
    it { expect(response).to have_http_status(:success) }
    it { expect(subject).to render_template('show') }
  end
end
