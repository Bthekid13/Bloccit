Rails.application.routes.draw do

  root 'welcome#index'

  # This means that users can just type /about instead of /welcome/about
  get 'about' => 'welcome#about'

  resources :topics do

    resources :posts, except: [:index]
    
  end

  resources :advertisements

  resources :questions

end
