Rails.application.routes.draw do

  post 'cash_flows/create'
  get 'cashiers/index'
  post 'cashiers/open'
  get 'cashiers/open'
  get 'cashiers/close'
  post 'cashiers/close'


  #resources
  resource :member_session, only: [:create, :new, :destroy]
  resource :member, as: 'account'
  resources :member_sessions
  resources :members do
    resources :dependents
  end
  resources :cashiers

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
