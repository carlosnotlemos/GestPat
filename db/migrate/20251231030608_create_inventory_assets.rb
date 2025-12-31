class CreateInventoryAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_assets do |t|
      t.references :inventory, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true

      t.timestamps
    end

    add_index :inventory_assets, [ :inventory_id, :asset_id ], unique: true
  end
end
