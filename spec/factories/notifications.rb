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
FactoryBot.define do
  factory :notification do
    user
    message { Faker::Lorem.sentence(word_count: 20) }
    association :notificationable, factory: :organization
    notification_type { Notification::USER_NEW }

    trait :organization_created do
      notification_type { Notification::ORGANIZATION_CREATED }
    end
  end
end
