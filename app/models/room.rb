# frozen_string_literal: true

# Class room
class Room < ApplicationRecord
  has_many :assets
  has_many :inventories

  has_many :user_rooms
  has_many :users, through: :user_rooms

  validates :name, presence: true
end
