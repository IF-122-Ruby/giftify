class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.string :reaction
      t.references :reactionable, polymorphic: true
      t.references :user

      t.timestamps
    end
  end
end
