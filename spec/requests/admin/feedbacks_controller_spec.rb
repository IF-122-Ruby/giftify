require 'rails_helper'

RSpec.describe Admin::FeedbacksController, type: :request do

  let(:superadmin) { create(:user, :superadmin) }
  let(:feedback) { create(:feedback) }

  before { sign_in superadmin }

  describe 'GET #index feedbacks' do
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

  describe '#feedback status' do
    context 'when admin viewed feedback' do
      it 'change viewed status' do
        expect(feedback.viewed).to be false
        get admin_feedback_path(feedback)
        
        feedback.reload

        expect(feedback.viewed).to be true
      end
    end
  end
end
