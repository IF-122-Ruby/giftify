class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.references :sender, polymorphic: true
      t.references :receiver, polymorphic: true

      t.timestamps
    end
  end
end
