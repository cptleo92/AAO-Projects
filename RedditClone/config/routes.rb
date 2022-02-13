Rails.application.routes.draw do

  root 'subs#index'

  resources :users, only: [:show, :new, :create]

  resource :sessions, only: [:new, :create, :destroy]

  resources :subs

  resources :posts, except: :index

  resources :comments, only: [:create]

  resources :posts do
    resources :comments, only: [:new]
  end

end
