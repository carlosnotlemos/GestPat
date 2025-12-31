class Asset < ApplicationRecord
  # belongs_to
  belongs_to :tenant
  belongs_to :asset_type
  belongs_to :location
  belongs_to :responsible_user, class_name: 'User', foreign_key: :responsible_user_id, optional: true

  #has_many
  has_many :asset_responsibilities
  has_many :responsibles, through: :asset_responsibilities, source: :user

  # validations
  validates :acquired_at, presence: true
  validates :identifier, uniqueness: { scope: :tenant_id }

  enum status: {
    active: 0,   # ativo e funcionando
    lost: 1,     # perdido
    damaged: 2,  # danificado
    retired: 3   # baixado/aposentado
  }
end
