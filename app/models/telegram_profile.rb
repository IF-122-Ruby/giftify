# == Schema Information
#
# Table name: telegram_profiles
#
#  id               :bigint           not null, primary key
#  connection_token :string
#  first_name       :string
#  last_name        :string
#  username         :string
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
class TelegramProfile < ApplicationRecord
  belongs_to :user, optional: true

  before_create :generate_token

  validates :telegram_id, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def generate_token
    self.connection_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end
end
