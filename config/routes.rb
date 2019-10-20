Rails.application.routes.draw do

  resources :users
  resources :products
  resources :carts

  root 'static_pages#home'
  get '/login' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

end
