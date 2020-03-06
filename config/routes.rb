Rails.application.routes.draw do
  get 'registrations/create'
  get 'registrations/delete'
  root 'static_pages#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  
  post '/register', to: 'events#attend'

  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end
