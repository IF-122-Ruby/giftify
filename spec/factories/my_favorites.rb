# == Schema Information
#
# Table name: my_favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_my_favorites_on_user_id  (user_id)
#
FactoryBot.define do
  factory :my_favorite do
    
  end
end
