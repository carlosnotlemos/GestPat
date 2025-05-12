# frozen_string_literal: true

module Inventories
  # Class Inventories Main
  class BaseController < ApplicationController
    # Identifica quem está acessando essa pagina pela role.
    before_action :check_role

    def new
      @inventory = Inventory.new
      rooms_load = current_user.rooms.includes(:assets)
      @rooms = rooms_load
      @assets = rooms_load.find(params[:room_id]).assets if params[:room_id].present?
    end

    def create
      ActiveRecord::Base.transaction do
        set_inventory_attributes

        if @inventory.save
          create_inventory_assets
          create_found_itens if params[:found_items].present?

          redirect_to after_create_path, notice: "Inventario criado com sucesso."
        else
          render :new, status: :unprocessable_entity
        end
      end
    end

    private

    def set_inventory_attributes
      @inventory = Inventory.new(inventory_params)
      @inventory.user = current_user
      @inventory.checked_at = Time.current
    end

    def create_found_itens
      params[:found_items].each_value do |founditem_params|
        FoundItem.create!(
          inventory_id: @inventory.id,
          description: founditem_params[:description],
          quantity: founditem_params[:quantity]
        )
      end
    end

    def create_inventory_assets
      params[:assets].each do |asset_id, counted_quantity|
        InventoryAsset.create!(
          inventory_id: @inventory.id,
          asset_id: asset_id,
          counted_quantity: counted_quantity
        )
      end
    end

    def inventory_params
      params.require(:inventory).permit(:room_id, assets: {}, found_items: {})
    end

    def after_create_path
      raise NotImplementedError, "Implementação de after_create_path será feita no Controller filho."
    end

    # &.role.to_sym , conversão para simbolico, pois excpected_role é simbolica.
    def check_role
      return if current_user&.role&.to_sym == expected_role

      redirect_to authenticated_root_path, alert: "Acesso não autorizado."
    end
  end
end
