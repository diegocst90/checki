class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, :null=>false
      t.references :user, :null=>false
      t.references :type_account, :null=>false
      t.references :currency, :null=>false
      t.float :amount, :null=>false
      t.boolean :deleted, :default=>false

      t.timestamps
    end
    add_index :accounts, :user_id
    add_index :accounts, :type_account_id
    add_index :accounts, :currency_id
  end
end
