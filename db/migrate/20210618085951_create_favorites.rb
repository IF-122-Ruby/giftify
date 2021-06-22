class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :gift

      t.timestamps
      t.index [:user_id, :gift_id], unique: true
    end
  end
end
