# frozen_string_literal: true

# Class UserRoom
class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
