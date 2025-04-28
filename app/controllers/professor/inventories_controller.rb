module Professor
  class InventoriesController < Inventories::BaseController
    def index
      @inventories = current_user.inventories.pesquisa_avancada(params).order(checked_at: :desc)
      @rooms = Room.all
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
