Rails.application.routes.draw do
  # get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users

  resources :inventories

  # Painel para usuários logados
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  # Página pública
  root "home#index"
end
