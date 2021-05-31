require 'rails_helper'

RSpec.describe Account::UsersController, type: :request do
  let!(:admin) { FactoryBot.create(:user) }
  before { sign_in superadmin }
  
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
