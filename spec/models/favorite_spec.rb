# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gift_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_favorites_on_gift_id              (gift_id)
#  index_favorites_on_user_id              (user_id)
#  index_favorites_on_user_id_and_gift_id  (user_id,gift_id) UNIQUE
#
require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'relations' do
    it { should belong_to(:gift) }
    it { should belong_to(:user) }
  end
end
