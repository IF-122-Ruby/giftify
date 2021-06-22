require 'rails_helper'

RSpec.describe Account::TransactionController, type: :request do
  let!(:user) { create(:user, :simple, first_name: 'John') }

  before { sign_in user }

  describe 'GET #new' do
    it "returns http success" do
      get new_account_transaction_path, xhr: true

      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:receiver) { create(:user, :simple, organization: user.organization) }
    let(:transaction_params) { { transaction: { receiver_id: receiver.id, amount: 100 } } }

    context 'with empty balance' do
      it "returns http success" do
        post account_transaction_path, params: transaction_params, xhr: true

        expect(response).to be_successful
      end
    end

    context 'with not empty balance' do
      before { allow(user).to receive(:balance).and_return(1000) }

      it "returns http success" do
        post account_transaction_path, params: transaction_params, xhr: true

        expect(response).to be_successful
      end
    end
  end
end
