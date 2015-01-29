Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  #get 'sessions/new'

  #get 'users/new'

  root 'static_pages#home'
  
  get 'signup'  => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  #resources :users
  #resources :users do
    #member do
      #get :following, :followers
    #end
  #end

  resources :users
  resources :entries,          only: [:create, :destroy, :show]

  #esources :relationships,       only: [:create, :destroy]

end