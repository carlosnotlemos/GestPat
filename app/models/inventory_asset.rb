class InventoryAsset < ApplicationRecord
  belongs_to :inventory
  belongs_to :asset
end
