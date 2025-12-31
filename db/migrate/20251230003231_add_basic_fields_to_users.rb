class AddBasicFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string, null: false
    add_reference :users, :tenant, null: false, foreign_key: true
  end
end
