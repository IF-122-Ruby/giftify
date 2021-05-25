class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :name, null: false
      t.string :email, limit: 255, null: false
      t.string :reason, null: false
      t.string :subject, limit: 15, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
