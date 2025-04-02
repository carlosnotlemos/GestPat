class CreateFoundItems < ActiveRecord::Migration[8.0]
  def change
    create_table :found_items do |t|
      t.references :inventory, null: false, foreign_key: true
      t.string :description
      t.integer :quantity

      t.timestamps
    end
  end
end
