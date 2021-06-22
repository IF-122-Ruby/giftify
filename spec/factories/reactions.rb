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
FactoryBot.define do
  factory :reaction do
    user
    association :reactionable, factory: :micropost
    reaction { Reaction.reactions[:laugh] }
  end
end
