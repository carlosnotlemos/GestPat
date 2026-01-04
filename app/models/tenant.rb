class Tenant < ApplicationRecord
  # has_many
  has_many :users
  has_many :locations
  has_many :user_locations

  # validations
  validates :name, presence: true
end
