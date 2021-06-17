# == Schema Information
#
# Table name: likes
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  gift_id        :bigint           not null
#  my_favorite_id :bigint
#
# Indexes
#
#  index_likes_on_gift_id         (gift_id)
#  index_likes_on_my_favorite_id  (my_favorite_id)
#
# Foreign Keys
#
#  fk_rails_...  (gift_id => gifts.id)
#
require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
