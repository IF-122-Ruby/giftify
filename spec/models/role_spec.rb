# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  role            :string           default("user"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_roles_on_organization_id              (organization_id)
#  index_roles_on_user_id_and_organization_id  (user_id,organization_id) UNIQUE
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:organization) }
    it { is_expected.to belong_to(:user) }
  end
  describe 'validation' do
    it { is_expected.to define_enum_for(:role).with_values(Role.roles).backed_by_column_of_type(:string) }
    
    context "when valid Factory role" do
      it "has a valid Role" do
        expect(build(:role)).to be_valid
      end
    end
  end
end
