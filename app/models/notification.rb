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
#  index_notifications_on_read              (read)
#  index_notifications_on_user_id           (user_id)
#
class Notification < ApplicationRecord
  USER_NEW = 'USER_NEW'.freeze
  USER_DELETED = 'USER_DELETED'.freeze
  GIFT_NEW = 'GIFT_NEW'.freeze
  GIFT_DELETED = 'GIFT_NEW'.freeze
  NOTIFICATION_TYPES = [USER_NEW, GIFT_NEW].freeze

  belongs_to :notificationable, polymorphic: true
  belongs_to :user
end
