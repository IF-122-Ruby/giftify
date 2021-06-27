# == Schema Information
#
# Table name: notifications
#
#  id                    :bigint           not null, primary key
#  message               :text
#  notification_type     :string
#  notificationable_type :string
#  read                  :boolean          default(FALSE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  notificationable_id   :bigint
#  user_id               :bigint
#
# Indexes
#
#  index_notifications_on_notificationable  (notificationable_type,notificationable_id)
#  index_notifications_on_user_id           (user_id)
#
class Notification < ApplicationRecord
  USER_NEW = 'USER_NEW'.freeze
  ORGANIZATION_CREATED = 'ORGANIZATION_CREATED'.freeze
  NOTIFICATION_TYPES = [USER_NEW, ORGANIZATION_CREATED].freeze

  belongs_to :notificationable, polymorphic: true
  belongs_to :user

  scope :recent, -> { order(created_at: :desc).limit(10) }
  scope :unread, -> { where(read: false) }
  validates :message, presence: true
end
