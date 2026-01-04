Rails.application.routes.draw do
  # get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  # Painel para usuários logados
  authenticated :user do
    resources :inventories

    namespace :manager do
      resources :users
    end

    root to: "dashboard#index", as: :authenticated_root
  end

  # Página pública
  root "home#index"
end
