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
    let(:transaction_params) { { transaction: { receiver_id: receiver.id, amount: 10 } } }

    context 'with empty balance' do
      it 'changes balance on 0 points' do
        expect do
          post account_transaction_path, params: transaction_params, xhr: true
        end.to change(receiver, :balance).by(0).and change(user, :balance).by(0)
      end
    end

    context 'with not empty balance' do
      let!(:transaction) { create(:transaction, receiver: user, sender: user.organization, amount: 1000) }

      it 'changes balances in current user and receiver user' do
        expect do
          post account_transaction_path, params: transaction_params, xhr: true
        end.to change(user, :balance).by(-10).and change(receiver, :balance).by(10)
      end
    end
  end
end
