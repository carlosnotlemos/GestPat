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

  # validations
  validates :email, :name, :role, presence: true

  enum role: {
    viewer: 0,
    operator: 1,
    manager: 2,
    admin: 3
  }
end
