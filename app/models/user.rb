class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # belongs_to
  belongs_to :tenant

  # has_many
  has_many :asset_responsibilities
  has_many :responsible_assets, through: :asset_responsibilities, source: :asset
  has_many :user_locations
  has_many :locations, through: :user_locations

  # validations
  validates :email, :name, :role, presence: true

  enum role: {
    operator: 0,
    manager: 1,
    admin: 2
  }
end
