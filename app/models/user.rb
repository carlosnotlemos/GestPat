class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :inventories
  validates :email, uniqueness: true
  validates :name, :email, :password, :role, presence: true
end
