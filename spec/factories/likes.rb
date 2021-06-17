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
FactoryBot.define do
  factory :like do
    
  end
end
