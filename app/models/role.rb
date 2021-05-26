# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  role            :integer
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
  SUPERADMIN = 'superadmin'.freeze
  ADMIN = 'admin'.freeze
  MANAGER = 'manager'.freeze
  USER = 'user'.freeze
  USER_ROLES = [SUPERADMIN, ADMIN, MANAGER, USER].freeze

  enum role: USER_ROLES

  belongs_to :user
  belongs_to :organization

  validates :role, inclusion: { in: USER_ROLES }
end
