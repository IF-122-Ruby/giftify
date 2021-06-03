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
  REASON = [['Want delete organization','0'],['Find bug','1'],
            ['About partnership','2'],['Other','3']].freeze

  validates :name, :email, :reason, :subject, :message, presence: true
  
  validates :email, length: { maximum: 255 },
                    format: { with: Devise::email_regexp,
                              message: "Email seems invalid" }
  
  validates :subject, length: { maximum: 15 }

end
