class AddRelationBeetweenPostAndCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :category_id , :integer, references: 'categories'
  end
end
