Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :users, only: [:new, :create, :show] do
    resources :goals, only: :index
  end

  resource :sessions, only: [:new, :create, :destroy]

  resources :goals, except: :index
end
