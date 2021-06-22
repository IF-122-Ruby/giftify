# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gift_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_favorites_on_gift_id              (gift_id)
#  index_favorites_on_user_id              (user_id)
#  index_favorites_on_user_id_and_gift_id  (user_id,gift_id) UNIQUE
#
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gift
end
