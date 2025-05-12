# frozen_string_literal: true

# Class InventoryAsset
class InventoryAsset < ApplicationRecord
  belongs_to :inventory
  belongs_to :asset

  validates :counted_quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
