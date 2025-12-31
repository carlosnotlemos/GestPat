class InventoryAsset < ApplicationRecord
  # belongs_to
  belongs_to :inventory
  belongs_to :asset
end
