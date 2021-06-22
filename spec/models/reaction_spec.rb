# == Schema Information
#
# Table name: reactions
#
#  id                :bigint           not null, primary key
#  reaction          :string
#  reactionable_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  reactionable_id   :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_reactions_on_reactionable  (reactionable_type,reactionable_id)
#  index_reactions_on_user_id       (user_id)
#
require 'rails_helper'

RSpec.describe Reaction, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:reactionable) }
  end

  describe 'validation' do
    it { is_expected.to define_enum_for(:reaction).with_values(Reaction.reactions).backed_by_column_of_type(:string) }

    context "when valid Factory reaction" do
      it "has a valid Reaction" do
        expect(build(:reaction)).to be_valid
      end
    end
  end
end
