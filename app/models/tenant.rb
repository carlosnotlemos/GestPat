class Tenant < ApplicationRecord
  # has_many
  has_many :users

  # validations
  validates :name, presence: true
end
