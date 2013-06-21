class CreateCurrencyLogs < ActiveRecord::Migration
  def change
    create_table :currency_logs do |t|
      t.references :currency, :null=>false
      t.float :value, :null=>false
      t.boolean :deleted, :default=>false

      t.timestamps
    end
    add_index :currency_logs, :currency_id
  end
end
