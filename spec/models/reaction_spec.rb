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
  pending "add some examples to (or delete) #{__FILE__}"
end
