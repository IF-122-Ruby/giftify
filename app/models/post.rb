# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  description  :text
#  image        :string
#  published_at :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint
#  user_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  scope :published,        ->{ where('published_at <= ?', Time.zone.now) }
  scope :ordered,          ->{ order(:created_at) }
  scope :by_category_name, ->(category_name) { joins(:category).where(category: { name: category_name } ) }

  belongs_to :user
  belongs_to :category

  validates :title, :description, presence: true

  def published?
    published_at.present? && published_at <= Time.zone.now 
  end
end
