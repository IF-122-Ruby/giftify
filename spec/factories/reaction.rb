FactoryBot.define do
  factory :reaction do
    user
    association :reactionable, factory: :micropost
    reaction { Reaction.reactions[:laugh] }
  end
end