# frozen_string_literal: true

module Ferramentaria
  # Call to Inventories
  class InventoriesController < Inventories::BaseController
    def index
      @inventories = current_user.inventories.pesquisa_avancada(params).order(checked_at: :desc)
    end

    private

    def after_create_path
      ferramentaria_inventories_path
    end

    def expected_role
      :ferramentaria
    end
  end
end
