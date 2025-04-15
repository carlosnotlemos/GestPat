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
      # Identificação do usuário deve ser passada aqui por segurança.
      @inventory.user = current_user

      if @inventory.save
        redirect_to after_create_path, notice: "Inventario criado com sucesso."
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def inventory_params
      params.require(:inventory).permit(:room_id, :checked_at)
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
