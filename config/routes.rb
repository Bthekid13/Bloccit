Rails.application.routes.draw do

  root to: 'welcome#index'

  # This means that users can just type /about instead of /welcome/about
  get 'about' => 'welcome#about'

  post 'users/confirm' => 'users#confirm'

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :labels, only: [:show]


end
