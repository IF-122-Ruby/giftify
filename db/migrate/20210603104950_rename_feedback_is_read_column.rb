class RenameFeedbackIsReadColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :feedbacks, :is_read, :viewed
  end
end
