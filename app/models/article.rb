# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  page_name  :string           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  HELP = 'help'.freeze
  INFO = 'info'.freeze

  PAGE_NAMES = [HELP, INFO].freeze

  enum page_name: { help: HELP, info: INFO }

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :page_name, presence: true, uniqueness: true
  validates :page_name, inclusion: { in: page_names.keys }

end
