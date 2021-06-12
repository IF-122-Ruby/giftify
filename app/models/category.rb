# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
class Category < ApplicationRecord
  scope :ordered_by_name, ->{ order(:name) }

  has_many :posts, dependent: :destroy
  
  validates :name, presence: true
  validates :name, uniqueness: true
end
