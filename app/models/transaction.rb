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
class Transaction < ApplicationRecord
  belongs_to :sender, polymorphic: true
  belongs_to :receiver, polymorphic: true

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :sender, presence: true
  validates :receiver, presence: true
  validate :balance_cannot_be_less_than_amount, on: :user_to_user

  private

  def balance_cannot_be_less_than_amount
    if sender.balance < amount
      errors.add(:amount, "can't be greater than the balance")
    end
  end
end
