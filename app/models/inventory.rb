class Inventory < ApplicationRecord
  has_many :inventory_assets
  has_many :assets, through: :inventory_assets
  has_many :found_items

  belongs_to :user
  belongs_to :room

  validates :checked_at, presence: true

  def self.pesquisa_avancada(params)
    rooms = all
    rooms = rooms.where(room_id: params[:room_id]) if params[:room_id].present?
    rooms = rooms.where(checked_at: Date.parse(params[:checked_at]).at_beginning_of_month..Date.parse(params[:checked_at]).at_end_of_month) if params[:checked_at].present?
    rooms
  end
end
