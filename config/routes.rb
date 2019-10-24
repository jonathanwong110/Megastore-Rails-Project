Rails.application.routes.draw do


  get 'cart_products/index'
  get 'cart_products/show'
  get 'cart_products/new'
  get 'cart_products/create'
  get 'cart_products/edit'
  get 'cart_products/update'
  get 'cart_products/destroy'
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

end
