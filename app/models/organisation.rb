class Organisation < ApplicationRecord
  validates :name, :creator_id, { presence: true }
  validates :name, confirmation: { case_sensitive: false }
  validates :creator_id, :monthly_point, numericality: { only_integer: true }
end
