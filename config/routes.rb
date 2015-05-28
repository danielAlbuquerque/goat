Rails.application.routes.draw do
  get 'member_sessions/new'

  get 'member_sessions/create'

  get 'member_sessions/destroy'

  get 'home/index'

  #resources
  resource :member_session, only: [:create, :new, :destroy]
  resource :member, as: 'account'
  resources :member_sessions
  resources :members do
    resources :dependents
  end

  #Authlogic
  get 'login' => "member_sessions#new", as: :login
  get 'logout' => "member_sessions#destroy", as: :logout
  post '/member_sessions/create'
  get 'signup' => 'users#new', as: :signup

  #Custom routes

  #Members
  get 'membros' => "members#index", as: :membros
  get 'novo-membro' => 'members#new', as: "novo-mebro"

  #Root route
  root 'home#index'

end
