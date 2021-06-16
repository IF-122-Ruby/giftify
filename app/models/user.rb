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
  has_many :invites, foreign_key: 'user_id'
  has_many :sender_transactions, as: :sender, class_name: "Transaction"
  has_many :receiver_transactions, as: :receiver, class_name: "Transaction"
  has_many :own_notifications, class_name: 'Notification', dependent: :destroy

  delegate :superadmin?, :admin?, :manager?, :simple?, to: :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  accepts_nested_attributes_for :owned_organization
  accepts_nested_attributes_for :role, reject_if: :all_blank

  after_create_commit :new_user_notification

  def self.grouped_collection_by_role
    {
      'superadmin' => User.superadmins.limit(10),
      'admin' => User.admins.limit(10),
      'manager' => User.managers.limit(10),
      'user' => User.users.limit(10)
    }
  end

  def balance
    receiver_transactions.sum(:amount) - sender_transactions.sum(:amount)
  end

  def new_user_notification
    return if organization.nil?

    own_notifications.create(message: "Welcome to organization #{organization.name}",
                             notificationable: organization,
                             notification_type: Notification::USER_NEW)
  end
end
