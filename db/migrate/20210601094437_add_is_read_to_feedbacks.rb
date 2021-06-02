class AddIsReadToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :is_read, :boolean, default: false
  end
end
