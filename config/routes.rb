Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  
  post '/attend', to: 'registrations#create'
  delete '/unattend', to: 'registrations#destroy'

  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end
