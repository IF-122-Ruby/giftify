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
FactoryBot.define do
  factory :transaction do
    amount { 10 }
    receiver
    sender
  end
end
