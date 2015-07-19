Rails.application.routes.draw do
  mount Dashing::Engine, at: Dashing.config.engine_path

  get 'suggestions' => 'suggestions#index'

  get 'dashboard' => 'dashboard#index'

  resources :foods

  resources :nutrients

  resources :diseases

  resources :users
end
