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
  get    'import'  => 'import_course#new'
  post   'import_courses' => 'import_course#create'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :entries,         only: [:create, :destroy, :show]
  resources :relationships,   only: [:create, :destroy]
  resources :comments,        only: [:create, :destroy]

  resources :books do
    get "delete"
  end

  resources :courses do
    collection {post :import}
  end
end