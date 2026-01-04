class Location < ApplicationRecord
  # belongs_to 
  belongs_to :tenant
  belongs_to :parent, class_name: "Location", optional: true

  # has_many
  has_many :children, class_name: "Location", foreign_key: :parent_id
  has_many :user_locations
  has_many :users, through: :user_locations

  # validations
  validates :name, :kind, presence: true

  enum kind: {
    organization: 0,
    building: 1,
    area: 2,
    storage: 3,
    room: 4,
    external: 5
  }
  
end
