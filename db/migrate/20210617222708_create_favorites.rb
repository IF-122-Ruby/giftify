class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :favorited, polymorphic: true, index: true

      t.timestamps
    end
  end
end
