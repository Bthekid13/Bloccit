Rails.application.routes.draw do

  root to: 'welcome#index'

  # This means that users can just type /about instead of /welcome/about
  get 'about' => 'welcome#about'

  post 'users/confirm' => 'users#confirm'

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

end
