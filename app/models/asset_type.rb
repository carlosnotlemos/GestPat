class AssetType < ApplicationRecord
  # belongs_to
  belongs_to :tenant
  
  #has_many
  has_many :assets
  
  # validations
  validates :name, presence: true
end
