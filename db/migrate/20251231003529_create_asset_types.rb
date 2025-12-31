class CreateAssetTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :asset_types do |t|
      t.references :tenant, null: false, foreign_key: true
      t.string :name, null: false
      t.string :manufacturer
      t.string :model

      t.timestamps
    end
  end
end
