class Room < ApplicationRecord
  has_many :assets
  has_many :inventories

  validates :name, presence: true
end
