class CreateTypeAccounts < ActiveRecord::Migration
  def change
    create_table :type_accounts do |t|
      t.string :name, :null=>false
      t.string :label, :null=>false
      t.boolean :deleted, :default=>false
      
      t.timestamps
    end
  end
end
