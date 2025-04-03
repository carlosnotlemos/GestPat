class FoundItem < ApplicationRecord
  belongs_to :inventory

  validates :description, presence: true
end
