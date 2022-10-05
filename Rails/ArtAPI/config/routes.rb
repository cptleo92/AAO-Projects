Rails.application.routes.draw do
  
  resources :users, only: [:index, :show, :update, :destroy, :create]   

  resources :users do
    resources :artworks, only: :index
    resources :comments, only: :index
    get 'favorite', on: :member
  end

  resources :artworks, only: [:show, :update, :destroy, :create] 
  resources :artworks do
    resources :comments, only: :index
    # get 'favorite', on: :member
    # post 'favorite', on: :member
    # delete 'favorite', on: :member
  end

  resources :artwork_shares, only: [:destroy, :create]  
  # resources :artwork_shares do
    # get 'favorite', on: :member
    # post 'favorite', on: :member
    # delete 'favorite', on: :member
  # end

  resources :comments, only: [:create, :destroy]


  # get 'users/', to: 'users#index', as: 'users'
  # get 'users/:id', to: 'users#show', as: 'user'
  # post 'users/', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#delete'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'

end
