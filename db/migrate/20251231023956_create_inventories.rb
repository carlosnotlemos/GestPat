class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.datetime :checked_at, null: false

      t.timestamps
    end

    add_index :inventories, [ :tenant_id, :location_id, :checked_at ]
  end
end
