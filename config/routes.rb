Rails.application.routes.draw do



  root to: 'welcome#index'

  # This means that users can just type /about instead of /welcome/about
  get 'about' => 'welcome#about'

<<<<<<< HEAD
  devise_for :users
=======
  post 'users/confirm' => 'users#confirm'
>>>>>>> checkpoint-38

  resources :topics do
    resources :posts, except: [:index]
  end

<<<<<<< HEAD
  # resources :advertisements
  #
  # resources :questions
=======
  resources :users, only: [:new, :create]

<<<<<<< HEAD
  resources :advertisements

  resources :questions
>>>>>>> checkpoint-36
=======
  resources :sessions, only: [:new, :create, :destroy]
>>>>>>> checkpoint-38

end
