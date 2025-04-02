class CreateInventoryAssets < ActiveRecord::Migration[8.0]
  def change
    create_table :inventory_assets do |t|
      t.references :inventory, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
      t.integer :counted_quantity

      t.timestamps
    end
  end
end
