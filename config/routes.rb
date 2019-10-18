Rails.application.routes.draw do

  resources :customers, only: [:new, :create]
  resources :stores, only: [:index, :new, :create]
  resources :products
  resources :carts

  root 'static_pages#home'
  get '/login' => 'sessions#new'
  get '/signup' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
