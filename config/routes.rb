Rails.application.routes.draw do

  root to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :topics, except: [:edit, :new]
      resources :users,    only: [:index, :show]
      resources :topics,   only: [:index, :show]
      resources :posts,    only: [:index, :show]
      resources :comments, only: [:index, :show]
    end
  end

  # This means that users can just type /about instead of /welcome/about
  get 'about' => 'welcome#about'

  post 'users/confirm' => 'users#confirm'

  resources :topics do
    resources :posts, except: [:index]
    resources :comments, only: [:create, :destroy]
  end

  resources :posts, only: [] do
    resources :comments,  only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote

  end


  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  resources :labels, only: [:show]


end
