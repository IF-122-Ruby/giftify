require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
  describe '#set_class_for_category_link' do
    let!(:category)            { create(:category) }
    let!(:param_category_name) { category.name }
    let!(:category_name)       { param_category_name }

    subject { helper.set_class_for_category_link(category_name, param_category_name) } 

    context 'with the same category names' do
      it { is_expected.to include 'active' }
    end

    context 'with the different category names' do
      let!(:category_name) { param_category_name + 'test' }

      it { is_expected.not_to include 'active' }
    end
  end

  describe '#set_count_posts_for_category' do
    let!(:category) { create(:category) }
    let!(:posts)    { create_list(:post, 3, category: category, published_at: Time.zone.now - 10.minutes) }

    subject { helper.set_count_posts_for_category(category.id) }

    it { is_expected.to eq 3 }
  end
end
