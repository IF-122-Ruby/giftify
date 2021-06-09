# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  email      :string(255)      not null
#  message    :text             not null
#  name       :string           not null
#  reason     :string           not null
#  subject    :string(15)       not null
#  viewed     :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Feedback < ApplicationRecord
  DELETE_ORGANIZATION = 'Want delete organization'.freeze
  FIND_BUG = 'Find bug'.freeze
  PARTNERSHIP = 'About partnership'.freeze
  OTHER = 'Other'.freeze
  
  REASONS = [DELETE_ORGANIZATION, FIND_BUG, PARTNERSHIP, OTHER].freeze

  validates :name, :email, :reason, :subject, :message, presence: true
  
  validates :email, length: { maximum: 255 },
                    format: { with: Devise::email_regexp,
                              message: "Email seems invalid" }
  
  validates :subject, length: { maximum: 15 }

  validates :reason, inclusion: { in: REASONS }

  def mark_as_viewed!
    self.viewed = true
    self.save!
  end
end
