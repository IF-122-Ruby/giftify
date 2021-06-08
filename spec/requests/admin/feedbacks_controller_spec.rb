require 'rails_helper'

RSpec.describe Admin::OrganizationsController, type: :request do
  let(:superadmin) { create(:user, :superadmin) }
  let(:feedback) {create(:feedback)}

  before { sign_in superadmin }

  describe "feedbacks" do
    it "returns http success if signed in as superadmin" do
      get '/admin/feedbacks'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success status' do
      get admin_feedbacks_path(feedback)
      expect(response).to be_successful
    end
  end
end
