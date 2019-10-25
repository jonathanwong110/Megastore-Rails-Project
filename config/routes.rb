Rails.application.routes.draw do

  root 'static_pages#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  #get '/cart' => 'carts#index'
  #patch '/cart/:id' => 'carts#update', as: "add_to_cart"

  resources :users
  resources :products
  resources :carts
  resources :reviews

end
