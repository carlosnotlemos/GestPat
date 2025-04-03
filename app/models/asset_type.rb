class AssetType < ApplicationRecord
  has_many :assets

  validates :name, presence: true, uniqueness: true
end
