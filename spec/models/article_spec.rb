# == Schema Information
#
# Table name: articles
#
#  id              :bigint           not null, primary key
#  body            :string           not null
#  category        :string           not null
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_articles_on_organization_id  (organization_id)
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'relations' do
    it { should belong_to(:organization) }
  end

  describe 'validation' do
    it { is_expected.to define_enum_for(:category).with_values(Article.categories).backed_by_column_of_type(:string) }

    context "when valid Factory article" do
      it "has a valid article" do
        expect(build(:article)).to be_valid
      end
    end
  end
end
