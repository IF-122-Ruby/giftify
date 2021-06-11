# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar                 :string
#  birthday               :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  scope :admins, -> { joins(:role).where(roles: { role: Role::ADMIN }) }
  scope :managers, -> { joins(:role).where(roles: { role: Role::MANAGER }) }
  scope :users, -> { joins(:role).where(roles: { role: Role::USER }) }
  scope :superadmins, -> { joins(:role).where(roles: { role: Role::SUPERADMIN }) }

  has_one :role, dependent: :destroy
  has_one :owned_organization, class_name: 'Organization'
  has_one :organization, through: :role
  has_many :posts, dependent: :destroy
  has_many :colleagues, ->(user) { where.not(id: user.id) }, through: :organization, source: :users, class_name: 'User'

  delegate :superadmin?, :admin?, :manager?, :simple?, to: :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  accepts_nested_attributes_for :owned_organization
  accepts_nested_attributes_for :role, reject_if: :all_blank

  def self.grouped_collection_by_role
    {
      'superadmin' => User.superadmins.limit(10)
      'admin' => User.admins.limit(10),
      'manager' => User.managers.limit(10),
      'user' => User.users.limit(10),
    }
  end
end
