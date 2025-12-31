class CreateAssetResponsibilities < ActiveRecord::Migration[7.1]
  def change
    create_table :asset_responsibilities do |t|
      t.references :tenant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
      t.datetime :assigned_at, null: false
      t.datetime :removed_at

      t.timestamps
    end

    add_index :asset_responsibilities, [ :tenant_id, :asset_id, :assigned_at ]
  end
end
