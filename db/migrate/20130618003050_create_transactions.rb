class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.text :reason, :null=>false
      t.references :currency, :null=>false
      t.references :account, :null=>false
      t.references :category, :null=>false
      t.references :type_transaction, :null=>false
      t.float :amount, :null=>false
      t.datetime :date_trasanction, :null=>false
      t.boolean :deleted, :default=>false

      t.timestamps
    end
    add_index :transactions, :currency_id
    add_index :transactions, :account_id
    add_index :transactions, :category_id
    add_index :transactions, :type_transaction_id
  end
end
