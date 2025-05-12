# frozen_string_literal: true

# Class Asset
class Asset < ApplicationRecord
  has_many :inventory_assets
  has_many :inventories, through: :inventory_assets

  belongs_to :room
  belongs_to :asset_type

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
