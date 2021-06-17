# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  role            :string           default("simple"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_roles_on_organization_id              (organization_id)
#  index_roles_on_user_id_and_organization_id  (user_id,organization_id) UNIQUE
#
class Role < ApplicationRecord
  SUPERADMIN = 'superadmin'.freeze
  ADMIN = 'admin'.freeze
  MANAGER = 'manager'.freeze
  USER = 'user'.freeze
  USER_ROLES = [SUPERADMIN, ADMIN, MANAGER, USER].freeze

  enum role: { superadmin: SUPERADMIN, admin: ADMIN, manager: MANAGER, simple: USER }

  belongs_to :user
  belongs_to :organization

  validates :role, inclusion: { in: roles.values }, on: :superadmin_context
  validates :role, inclusion: { in: roles.values.excluding('superadmin') }, on: :admin_context
  validates :role, inclusion: { in: roles.values.excluding('superadmin', 'admin') }, on: :manager_context

  validates_uniqueness_of :user_id, scope: :organization_id
end
