class CreateFoundAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :found_assets do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
      t.references :inventory, null: false, foreign_key: true
      t.references :reported_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :found_assets, [ :tenant_id, :asset_id ]
  end
end
