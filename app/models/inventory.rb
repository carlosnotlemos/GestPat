# frozen_string_literal: true

# Class Inventory
class Inventory < ApplicationRecord
  has_many :inventory_assets
  has_many :assets, through: :inventory_assets
  has_many :found_items

  belongs_to :user
  belongs_to :room

  validates :checked_at, presence: true

  def self.pesquisa_avancada(params)
    scope = all
    scope = scope.where(room_id: params[:room_id]) if params[:room_id].present?
    if params[:checked_at].present?
      date = Date.parse(params[:checked_at]) rescue nil
      scope = scope.where(checked_at: date.at_beginning_of_month..date.at_end_of_month) if date.present?
    end
    scope
  end
end
