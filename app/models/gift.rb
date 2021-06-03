# == Schema Information
#
# Table name: gifts
#
#  id              :bigint           not null, primary key
#  amount          :integer
#  description     :text
#  gift_type       :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_gifts_on_organization_id  (organization_id)
#
class Gift < ApplicationRecord
  belongs_to :organization

  MERCH = 'merch'.freeze
  COUPON = 'coupon'.freeze

  GIFTS_TYPE = [MERCH, COUPON].freeze

  enum gift_type: { merch: MERCH, coupon: COUPON }
  validates :name, presence: true
  validates :gift_type, inclusion: { in: gift_types.values }
end
