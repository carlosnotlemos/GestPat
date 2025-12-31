class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.references :tenant, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :kind, null: false
      t.references :parent, foreign_key: { to_table: :locations }

      t.timestamps
    end
  end
end
