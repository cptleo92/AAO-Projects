Rails.application.routes.draw do

  root 'subs#index'

  resources :users, only: [:show, :new, :create]

  resource :sessions, only: [:new, :create, :destroy]

  resources :subs

  resources :posts, except: :index do
    member do
      get 'upvote'
      get 'downvote'
    end
  end

  resources :comments, only: [:create, :show] do
    member do
      get 'upvote'
      get 'downvote'
    end
  end

  resources :posts do
    resources :comments, only: [:new]    
  end

end
