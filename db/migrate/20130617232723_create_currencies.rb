class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name, :null=>false
      t.string :label, :null=>false
      t.float :value, :null=>false
      t.boolean :deleted, :default=>false
      
      t.timestamps
    end
  end
end
