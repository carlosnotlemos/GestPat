Rails.application.routes.draw do
  devise_for :users

  # Rotas para usuários autenticados
  authenticated :user do
    root to: "rails/welcome#index", as: :authenticated_root

    # PROFESSOR E FERRAMENTARIA APENAS FAZEM INVENTARIOS!
    %w[professor ferramentaria].each do |inventory|
      namespace inventory do
        resources :inventories, only: %i[ index new create ], path: "inventario"
      end
    end

    # ASSISTENTE E ESTÁGIARIO APENAS VERIFICAM E ATESTAM OS INVENTÁRIOS
    %w[assistente estagiario].each do |analist|
      namespace analist do
        resources :inventories, only: %i[ index edit update ], path: "inventario"
      end
    end

    # GESTOR E COORDENADOR ANALISAM , EXCLUEM OU ADICIONAM USUARIOS OU PATRIMONIOS
    %w[coordenador gestor].each do |admin|
      namespace admin do
        resources :inventories, only: %i[ index edit update destroy ], path: "inventario"
        resources :assets, path: "patrimonio"
        resources :users, path: "usuarios"
      end
    end
  end

  # Rotas para usuários não autenticados
  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  # Health check do Rails
  get "up" => "rails/health#show", as: :rails_health_check
end
