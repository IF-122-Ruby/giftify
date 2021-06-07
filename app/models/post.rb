# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  description  :text
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

  validates :title, :description, presence: true

  scope :published, -> { where('published_at <= ?', Time.zone.now) }

  def published?
    published_at.present? && published_at <= Time.zone.now
  end
end
