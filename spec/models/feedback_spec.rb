# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  email      :string
#  message    :text
#  name       :string
#  reason     :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Feedback, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :reason }
  it { is_expected.to validate_presence_of :subject }

  it { is_expected.to validate_length_of(:email).is_at_most(255) }
  it { is_expected.to validate_length_of(:subject).is_at_most(15) }
  it { is_expected.to allow_value('example@email.com').for(:email) }

end
