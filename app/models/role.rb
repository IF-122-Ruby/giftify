# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  role            :string           default("user"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_roles_on_organization_id  (organization_id)
#  index_roles_on_user_id          (user_id)
#
class Role < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  validates :role, inclusion: ['superadmin', 'admin', 'manager', 'user']
end
# User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, birthday: Faker::Date.birthday(min_age: 18, max_age: 65), avatar: Faker::LoremFlickr.image, email: Faker::Internet.email)
