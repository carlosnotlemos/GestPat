module Professor
  class InventoriesController < Inventories::BaseController
    def index
    @inventories = current_user.inventories
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
