# == Schema Information
#
# Table name: my_favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_my_favorites_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe MyFavorite, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
