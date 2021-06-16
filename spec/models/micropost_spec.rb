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
require 'rails_helper'

RSpec.describe Micropost, type: :model do
  describe "create micropost" do
    let!(:organization) { create(:organization) }
    let!(:user) { create(:user, organization: organization) }
    let(:micropost) { Micropost.create(title: "Hello", description: "World", author: user) }

    context 'check valid' do
      it { expect(micropost).to be_valid }
    end
    
    context 'try save' do
      it { expect(micropost.save).to be_truthy }
    end
  end
end
