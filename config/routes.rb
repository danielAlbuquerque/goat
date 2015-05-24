Rails.application.routes.draw do
  get 'member_sessions/new'

  get 'member_sessions/create'

  get 'member_sessions/destroy'

  get 'home/index'

  #resources
  resource :member_session, only: [:create, :new, :destroy]  

  
  #Root route
  root 'home#index'

  #Authlogic
  resources :member_sessions
  get 'login' => "member_sessions#new", as: :login
  get 'logout' => "member_sessions#destroy", as: :logout
  post '/member_sessions/create'
  resources :members
  resource :member, as: 'account'
  get 'signup' => 'users#new', as: :signup

 
end
