module SidebarHelper
  def sidebar_links_for(user)
    return [] unless user

    # Links que são comum a todos!
    base_links = [ {} ]

    case user.role.to_sym
    when :professor
      links = [
        { label: "Histórico", path: professor_inventarios_path },
        { label: "Novo inventário", path: professor_novo_inventario_path }
      ]
    when :ferramentaria
      links = [
        { label: "Histórico", path: ferramentaria_inventarios_path }
      ]
    when :estagiario
    when :assistente
    when :gestor
    when :coordenador
    end

    links
  end
end
