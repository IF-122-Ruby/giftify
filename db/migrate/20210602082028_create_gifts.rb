class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.string :name
      t.text :description
      t.integer :amount
      t.integer :price
      t.string :gift_type
      t.references :organization

      t.timestamps
    end
  end
end
