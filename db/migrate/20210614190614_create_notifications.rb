class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user
      t.text :message
      t.string :notification_type
      t.boolean :read
      t.references :notificationable, polymorphic: true

      t.timestamps
    end

    add_index :notifications, :read
  end
end
