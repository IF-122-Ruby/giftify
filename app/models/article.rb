# == Schema Information
#
# Table name: articles
#
#  id              :bigint           not null, primary key
#  body            :string           not null
#  category        :string           not null
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_articles_on_organization_id  (organization_id)
#
class Article < ApplicationRecord
  ORGANIZATION_RULES = 'Organization rules'.freeze
  INFO = 'Info'.freeze
  HELP = 'Help'.freeze
  CATEGORIES = [HELP, INFO, ORGANIZATION_RULES].freeze

  enum category: { help: HELP, info: INFO, organization_rules: ORGANIZATION_RULES }
  
  scope :info, -> { where(category: :info) }
  scope :help, -> { where(category: :help) }
  scope :organization_rules, -> { where(category: :organization_rules) }

  belongs_to :organization

  validates :title, uniqueness: true
  validates :body, presence: true
  validates :category, inclusion: { in: categories.keys }

end
