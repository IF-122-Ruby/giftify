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
  validates :title, uniqueness: true
  validates :body, presence: true
  validates :page_name, presence: true, uniqueness: true

end
