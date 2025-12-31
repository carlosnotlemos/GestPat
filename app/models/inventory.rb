class Inventory < ApplicationRecord
  # belongs_to
  belongs_to :tenant
  belongs_to :user
  belongs_to :location

  # has_many
  has_many :found_items
  has_many :inventory_assets
  has_many :assets, thorugh: :inventory_assets
  
  # validations
  validates :checked_at, presence: true
end
