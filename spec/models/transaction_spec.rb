# == Schema Information
#
# Table name: transactions
#
#  id            :bigint           not null, primary key
#  amount        :integer
#  receiver_type :string
#  sender_type   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  receiver_id   :bigint
#  sender_id     :bigint
#
# Indexes
#
#  index_transactions_on_receiver  (receiver_type,receiver_id)
#  index_transactions_on_sender    (sender_type,sender_id)
#
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :amount }
    it { is_expected.to validate_presence_of :sender }
    it { is_expected.to validate_presence_of :receiver }
  end
end
