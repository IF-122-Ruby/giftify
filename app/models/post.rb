# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  description  :text
#  is_published :boolean
#  published_at :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user

  before_save :set_published_status

  validates :title, :description, presence: true

  def set_published_status
    if self.published_at.blank? || self.published_at < Time.zone.now
      self.is_published = true
    else
      self.is_published = false
    end
  end
end
