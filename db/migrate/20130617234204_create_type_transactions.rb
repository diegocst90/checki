class CreateTypeTransactions < ActiveRecord::Migration
  def change
    create_table :type_transactions do |t|
      t.string :name, :null=>false
      t.string :label, :null=>false
      t.boolean :deleted, :default=>false

      t.timestamps
    end
  end
end
