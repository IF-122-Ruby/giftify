# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts) }
  end
end
