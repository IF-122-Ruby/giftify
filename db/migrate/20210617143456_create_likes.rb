class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :my_favorite
      t.references :gift, null: false, foreign_key: true

      t.timestamps
    end
  end
end
