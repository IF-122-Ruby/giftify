class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user
      t.text :message
      t.string :notification_type
      t.boolean :read, default: false
      t.references :notificationable, polymorphic: true

      t.timestamps
    end
  end
end
