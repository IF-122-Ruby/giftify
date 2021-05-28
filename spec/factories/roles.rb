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
#  index_roles_on_organization_id              (organization_id)
#  index_roles_on_user_id_and_organization_id  (user_id,organization_id) UNIQUE
#
FactoryBot.define do
  factory :role, class: Role do
    user
    organization
    role { Role::USER }
  end
end
