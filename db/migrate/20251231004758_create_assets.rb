class CreateAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :assets do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :asset_type, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :responsible_user, foreign_key: { to_table: :users }
      t.string :identifier, null: false
      t.string :serial_number
      t.integer :status, null: false, default: 0
      t.date :acquired_at, null: false

      t.timestamps
    end

    add_index :assets, [ :tenant_id, :identifier ], unique: true
  end
end
