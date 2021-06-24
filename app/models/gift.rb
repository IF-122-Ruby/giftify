# == Schema Information
#
# Table name: gifts
#
#  id              :bigint           not null, primary key
#  amount          :integer
#  description     :text
#  gift_type       :string
#  image           :string
#  name            :string
#  price           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_gifts_on_organization_id  (organization_id)
#
require 'elasticsearch/model'

class Gift < ApplicationRecord
  include Elasticsearch::Model

  mount_uploader :image, ImageUploader

  MERCH = 'merch'.freeze
  COUPON = 'coupon'.freeze
  GIFT_TYPES = [MERCH, COUPON].freeze

  enum gift_type: { merch: MERCH, coupon: COUPON }

  belongs_to :organization

  has_many   :transactions, as: :receiver
  has_many   :favorites, dependent: :destroy

  scope :ordered, -> { includes(:transactions).order('created_at desc') }

  validates :name, :description, presence: true
  validates :gift_type, inclusion: { in: gift_types.values }
end
