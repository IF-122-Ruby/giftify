# == Schema Information
#
# Table name: telegram_profiles
#
#  id               :bigint           not null, primary key
#  connection_token :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  telegram_id      :string
#  user_id          :bigint
#
# Indexes
#
#  index_telegram_profiles_on_connection_token  (connection_token) UNIQUE
#  index_telegram_profiles_on_telegram_id       (telegram_id) UNIQUE
#  index_telegram_profiles_on_user_id           (user_id)
#
FactoryBot.define do
  factory :telegram_profile do
    user
    telegram_id { Faker::Number.number(digits: 10) }
    connection_token { Faker::Internet.base64 }
  end
end
