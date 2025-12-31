class AssetResponsibility < ApplicationRecord
  # belongs_to
  belongs_to :tenant
  belongs_to :user
  belongs_to :asset

  # validations
  validates :assigned_at, presence: true
end
