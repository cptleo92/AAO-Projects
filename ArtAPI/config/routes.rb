Rails.application.routes.draw do
  
  resources :users, only: [:index, :show, :update, :destroy, :create]   

  resources :users do
    resources :artworks, only: :index
  end

  resources :artworks, only: [:show, :update, :destroy, :create]   
  resources :artwork_shares, only: [:destroy, :create]   


  # get 'users/', to: 'users#index', as: 'users'
  # get 'users/:id', to: 'users#show', as: 'user'
  # post 'users/', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#delete'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'

end
