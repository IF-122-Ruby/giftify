# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  page_name  :string           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_presence_of :page_name }
    it { is_expected.to define_enum_for(:page_name).with_values(Article.page_names).backed_by_column_of_type(:string) }

    context "when valid Factory article" do
      it "has a valid article" do
        expect(build(:article, :help_page)).to be_valid
      end
    end
  end
end
