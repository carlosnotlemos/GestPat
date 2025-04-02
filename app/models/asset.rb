class Asset < ApplicationRecord
  belongs_to :room
  belongs_to :asset_type
end
