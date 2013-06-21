class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null=>false
      t.boolean :deleted, :default=>false

      t.timestamps
    end
  end
end
