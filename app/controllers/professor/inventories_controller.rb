# frozen_string_literal: true

module Professor
  # Call to Inventories
  class InventoriesController < Inventories::BaseController
    def index
      @inventories = current_user.inventories.pesquisa_avancada(params).order(checked_at: :desc)
      @rooms = current_user.rooms
    end

    private

    def after_create_path
      professor_inventarios_path
    end

    def expected_role
      :professor
    end
  end
end
