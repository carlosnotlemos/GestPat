class Inventory < ApplicationRecord
  has_many :inventory_assets
  has_many :assets, through: :inventory_assets
  has_many :found_items

  belongs_to :user
  belongs_to :room

  validates :checked_at, presence: true
end
