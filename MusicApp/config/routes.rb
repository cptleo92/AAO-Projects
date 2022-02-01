Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]

  resources :bands

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy]

  resources :albums do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :show, :update, :destroy]
end
