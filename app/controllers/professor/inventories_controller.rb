module Professor
  class InventoriesController < Inventories::BaseController
    def index
      @inventories = Inventory.all
    end

    private

    def after_create_path
      professor_inventories_path
    end

    def expected_role
      :professor
    end
  end
end
