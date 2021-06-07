# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  description  :text
#  is_published :boolean
#  published_at :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :post do
    title { Faker::Movies::Hobbit.character}
    description { Faker::Lorem.sentence(word_count: 230) }
    published_at { Time.zone.now + 10.minutes }
    user
  end
end
