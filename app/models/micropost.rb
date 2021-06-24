# == Schema Information
#
# Table name: microposts
#
#  id              :bigint           not null, primary key
#  description     :text
#  image           :string
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  author_id       :bigint
#  organization_id :bigint
#
# Indexes
#
#  index_microposts_on_author_id        (author_id)
#  index_microposts_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (organization_id => organizations.id)
#
class Micropost < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :author, class_name: "User"
  belongs_to :organization
  has_many :comments, as: :commentable

  has_many :reactions, as: :reactionable

  before_validation :add_author_organization, on: :create

  validates :title, :description, presence: true

  def add_author_organization
    self.organization = self.author.organization
  end
end
