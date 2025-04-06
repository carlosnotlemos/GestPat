class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  protected

  # Verifica o usuario por role e redireciona para sua pagina index.
  def after_sign_in_path_for(resource)
    case resource.role
    when "professor"
      professor_inventories_path
    when "ferramentaria"
      authenticated_root_path
    else
      authenticated_root_path
    end
  end
end
