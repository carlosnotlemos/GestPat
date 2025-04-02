class CreateAssets < ActiveRecord::Migration[8.0]
  def change
    create_table :assets do |t|
      t.references :room, null: false, foreign_key: true
      t.references :asset_type, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
