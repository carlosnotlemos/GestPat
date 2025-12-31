class FoundAsset < ApplicationRecord
  # belongs_to
  belongs_to :tenant
  belongs_to :asset
  belongs_to :inventory
  belongs_to :reported_by, class_name: 'User', foreign_key: :reported_by_id
end
