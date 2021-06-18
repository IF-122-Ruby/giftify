# == Schema Information
#
# Table name: favorites
#
#  id             :bigint           not null, primary key
#  favorited_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  favorited_id   :bigint
#  user_id        :bigint
#
# Indexes
#
#  index_favorites_on_favorited  (favorited_type,favorited_id)
#  index_favorites_on_user_id    (user_id)
#
FactoryBot.define do
  factory :favorite do
    user { nil }
    favorited { nil }
  end
end
