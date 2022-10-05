Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }  do
    resources :todos, only: [:show, :index, :create, :update, :destroy] 

    resources :steps, only: [:show, :index, :create, :update, :destroy]       
  end

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  root to: 'static_pages#root'
end
