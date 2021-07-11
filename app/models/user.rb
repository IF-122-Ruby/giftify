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
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  token                  :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'csv'

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  attr_accessor :skip_password_validation

  scope :admins, -> { joins(:role).where(roles: { role: Role::ADMIN }) }
  scope :managers, -> { joins(:role).where(roles: { role: Role::MANAGER }) }
  scope :users, -> { joins(:role).where(roles: { role: Role::USER }) }
  scope :superadmins, -> { joins(:role).where(roles: { role: Role::SUPERADMIN }) }
  scope :ordered_by_first_name, -> { order(:first_name) }

  has_one :role, dependent: :destroy
  has_one :owned_organization, class_name: 'Organization'
  has_one :organization, through: :role
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_gifts, through: :favorites, dependent: :destroy, source: :gift
  has_many :colleagues, ->(user) { where.not(id: user.id) }, through: :organization, source: :users, class_name: 'User'
  has_many :invites, foreign_key: 'user_id'
  has_many :sender_transactions, as: :sender, class_name: "Transaction"
  has_many :receiver_transactions, as: :receiver, class_name: "Transaction"
  has_many :own_notifications, class_name: 'Notification', dependent: :destroy
  has_many :microposts, class_name: "Micropost", foreign_key: "author_id"
  has_many :reactions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :my_gifts, through: :sender_transactions, source: :receiver, source_type: 'Gift'

  delegate :superadmin?, :admin?, :manager?, :simple?, to: :role

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :recoverable, :omniauthable, omniauth_providers: [:google_oauth2]

  validate :birthday_cannot_be_in_the_future
  validate :amount_points_of_gifts_for_month
  validates :first_name, :last_name, presence: true, length: { maximum: 40 }

  accepts_nested_attributes_for :owned_organization
  accepts_nested_attributes_for :role, reject_if: :all_blank

  before_create       :generate_token
  after_create_commit :new_user_notification

  index_name [Rails.env, model_name.collection.gsub(/\//, '-')].join('_')

  def self.grouped_collection_by_role
    {
      'superadmin' => User.superadmins.limit(10),
      'admin' => User.admins.limit(10),
      'manager' => User.managers.limit(10),
      'user' => User.users.limit(10)
    }
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def birthday_cannot_be_in_the_future
    if birthday.present? && birthday > Date.today
      errors.add(:birthday, "can't be in the future")
    end
  end

  def balance
    receiver_transactions.sum(:amount) - sender_transactions.sum(:amount)
  end

  def used_points_for_month
    sender_transactions.where(["created_at >= ? and created_at <= ?", Date.today.beginning_of_month.beginning_of_day, Date.today.end_of_month.end_of_day]).sum(:amount)
  end

  def used_points
    sender_transactions.sum(:amount)
  end

  def new_user_notification
    return if organization.nil?

    own_notifications.create(message: "Welcome to organization #{organization.name}",
                             notificationable: organization,
                             notification_type: Notification::USER_NEW)
  end

  def purchase_gift(gift)
    if (balance - gift.price).negative?
      return :not_enough_points
    elsif gift.amount == 0
      return :no_more_gifts
    elsif gift.amount.nil?
      Transaction.create(sender: self, receiver: gift, amount: gift.price)
    else
      ActiveRecord::Base.transaction do
        Transaction.create(sender: self, receiver: gift, amount: gift.price)
        gift.update!(amount: gift.amount - 1)
      end
    end
    :success
  end

  def amount_points_of_gifts_for_month
    sender_transactions.where(["created_at >= ? and created_at <= ? and receiver_type = ?", Date.today.beginning_of_month.beginning_of_day, Date.today.end_of_month.end_of_day, 'Gift']).sum(:amount)
  end

  def self.organization_statistic_csv
    attributes = ['id', 'full_name', 'balance', 'used_points_for_month', 'used_points']

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map { |attr| user.send(attr) }
      end
    end
  end

  def as_indexed_json(options = {})
    options.merge({ id: id,
                    first_name: first_name,
                    last_name: last_name,
                    birthday: birthday,
                    email: email,
                    created_at: created_at,
                    updated_at: updated_at,
                    organization_id: organization&.id })
  end

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end

  def self.from_omniauth(auth)
    google_user = User.find_or_initialize_by(email: auth.info.email).tap do |user|
      if user.new_record?
        user.assign_attributes(
          provider: auth[:provider],
          uid: auth[:uid],
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          email: auth.info.email
        )
        user.save
      end
    end
    google_user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if session["devise.google_data"].present?
        user.provider = session.dig('devise.google_data', 'provider') if user.provider.blank?
        user.uid = session.dig('devise.google_data', 'uid') if user.uid.blank?
        user.first_name = session.dig('devise.google_data', 'info', 'first_name') if user.first_name.blank?
        user.last_name = session.dig('devise.google_data', 'info', 'last_name') if user.last_name.blank?
        user.email = session.dig('devise.google_data', 'info', 'email') if user.email.blank?
      end
    end
  end

  private

  def password_required?
    return false if skip_password_validation
    super
  end
end
