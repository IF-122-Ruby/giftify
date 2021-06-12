# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  description  :text
#  image        :string
#  published_at :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :bigint
#  user_id      :bigint           not null
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
  end

  describe 'set published status for new post' do
    let!(:user) { create(:user) }

    context 'set published value false with date in the past' do
      let(:post) { create(:post, user: user, published_at: Time.zone.now - 10.minutes) }
      
      it 'should return false for is_published column' do  
        expect(post.published?).to be_truthy
      end
    end

    context 'set published value true with date in the future' do
      let(:post) { create(:post, user: user, published_at: Time.zone.now + 10.minutes) }

      it 'should return true for is_published column' do
        expect(post.published?).to be_falsy
      end
    end
    
  end
end
