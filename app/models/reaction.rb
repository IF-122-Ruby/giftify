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
class Reaction < ApplicationRecord
  LIKE = '👍'.freeze
  CONGRATULATION = '🎉'.freeze
  LAUGH = '😂'.freeze
  REACTIONS = [LIKE, CONGRATULATION, LAUGH].freeze

  enum reaction: { like: LIKE, congratulation: CONGRATULATION, laugh: LAUGH }

  belongs_to :user
  belongs_to :reactionable, polymorphic: true

  validates :reaction, inclusion: { in: reactions.keys }
  validates :reaction, uniqueness: { scope: %i[user_id reactionable_id reactionable_type] }
end
