Rails.application.routes.draw do

  resources :user_products
  root 'static_pages#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/cart' => 'carts#index'
  post '/cart' => 'cart#add_to_cart'


  resources :users
  resources :products
  resources :carts
  resources :reviews
  resources :cart_products

end
