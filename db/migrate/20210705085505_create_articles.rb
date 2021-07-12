class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, unique: true
      t.string :body, null: false
      t.string :page_name, null: false
      t.timestamps
    end
  end
end
