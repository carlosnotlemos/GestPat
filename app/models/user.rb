# frozen_string_literal: true

# Class User
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :inventories
  has_many :user_rooms
  has_many :rooms, through: :user_rooms

  validates :email, uniqueness: true
  validates :name, :role, presence: true

  enum :role, { professor: 0, ferramentaria: 1, estagiario: 2, assistente: 3, coordenador: 4, gestor: 5 }
end
