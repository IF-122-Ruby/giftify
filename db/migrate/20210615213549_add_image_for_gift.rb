class AddImageForGift < ActiveRecord::Migration[6.1]
  def change
    add_column :gifts, :image, :string
  end
end
