class AddObservationsToAssets < ActiveRecord::Migration[8.0]
  def change
    add_column :assets, :observations, :string
  end
end
