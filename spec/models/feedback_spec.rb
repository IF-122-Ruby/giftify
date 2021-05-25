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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Feedback, type: :model do
  let!(:feedback) { FactoryBot.build(:feedback) }
  
  context "when valid Factory feedback" do
    it "has a valid feedback" do
      expect(feedback).to be_valid
    end
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to allow_value('example@email.com').for(:email) }
    it { is_expected.to validate_presence_of :reason }
    it { is_expected.to validate_presence_of :subject }
    it { is_expected.to validate_length_of(:subject).is_at_most(15) }
  end 
end
