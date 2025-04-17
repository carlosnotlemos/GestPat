module Inventories
  class BaseController < ApplicationController
    # Identifica quem está acessando essa pagina pela role.
    before_action :check_role

    def new
      @inventory = Inventory.new
      @rooms = Room.all

      if params[:room_id].present?
        @assets = Asset.where(room_id: params[:room_id])
      end
    end

    def create
      @inventory = Inventory.new(inventory_params)
      @inventory.user = current_user
      @inventory.checked_at = Time.current

      if @inventory.save
        params[:assets].each do |asset_id, counted_quantity|
          InventoryAsset.create!(
            inventory_id: @inventory.id,
            asset_id: asset_id,
            counted_quantity: counted_quantity
          )
        end

        if params[:founditems].present?
          params[:founditems].each do |_key, founditem_params|
            founditem_desc = founditem_params[:description]
            founditem_quant = founditem_params[:quantity]

            FoundItem.create!(
              inventory_id: @inventory.id,
              description: founditem_desc,
              quantity: founditem_quant
            )
          end
        end
        redirect_to after_create_path, notice: "Inventario criado com sucesso."
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def inventory_params
      params.require(:inventory).permit(:room_id, assets: {})
    end

    def after_create_path
      raise NotImplementedError, "Implementação de after_create_path será feita no Controller filho."
    end

    # &.role.to_sym , conversão para simbolico, pois excpected_role é simbolica.
    def check_role
      unless current_user&.role.to_sym == expected_role
        # WARNING IMPLEMENTATION --> Implementar rota para acesso não autorizado.
        redirect_to authenticated_root_path, alert: "Acesso não autorizado."
      end
    end
  end
end
