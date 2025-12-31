class AssetMovement < ApplicationRecord
  # belongs_to
  belongs_to :tenant
  belongs_to :asset
  belongs_to :from_location, class_name: 'Location', foreign_key: :from_location_id, optional: true
  belongs_to :to_location, class_name: 'Location', foreign_key: :to_location_id, optional: true
  belongs_to :from_user, class_name: 'User', foreign_key: :from_user_id, optional: true
  belongs_to :to_user, class_name: 'User', foreign_key: :to_user_id, optional: true

  # validations 
  validates :moved_at, :status, presence: true

  enum status: {
    active: 0,   # ativo e funcionando
    lost: 1,     # perdido
    damaged: 2,  # danificado
    retired: 3   # baixado/aposentado
  }
end
