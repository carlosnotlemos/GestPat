module Ferramentaria
  class InventoriesController < Inventories::BaseController
    def index
      @inventories = Inventory.where(room_id: User.roles[:ferramentaria])
    end

    private

    def after_create_path
      ferramentaria_inventarios_path
    end

    def expected_role
      :ferramentaria
    end
  end
end
