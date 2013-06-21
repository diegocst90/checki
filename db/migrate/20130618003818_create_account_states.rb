class CreateAccountStates < ActiveRecord::Migration
  def change
    create_table :account_states do |t|
      t.references :account, :null=>false
      t.float :amount, :null=>false
      t.references :currency_log, :null=>false
      t.references :transaction, :null=>false
      t.boolean :deleted, :default=>false

      t.timestamps
    end
    add_index :account_states, :account_id
    add_index :account_states, :currency_log_id
    add_index :account_states, :transaction_id
  end
end
