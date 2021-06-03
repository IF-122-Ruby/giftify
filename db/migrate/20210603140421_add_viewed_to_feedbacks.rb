class AddViewedToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :viewed, :boolean, default: false, null: false
  end
end
