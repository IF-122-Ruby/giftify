# == Schema Information
#
# Table name: organizations
#
#  id            :bigint           not null, primary key
#  logo          :string
#  monthly_point :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_organizations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_numericality_of :monthly_point }
  end
end
