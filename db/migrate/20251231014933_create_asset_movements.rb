class CreateAssetMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :asset_movements do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
      t.references :from_location, foreign_key: { to_table: :locations }
      t.references :to_location, foreign_key: { to_table: :locations }
      t.references :from_user, foreign_key: { to_table: :users }
      t.references :to_user, foreign_key: { to_table: :users }
      t.integer :status, null: false
      t.datetime :moved_at, null: false

      t.timestamps
    end

    add_index :asset_movements, [ :tenant_id, :asset_id, :moved_at ]
  end
end
