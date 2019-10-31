Rails.application.routes.draw do

  root 'static_pages#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/cart' => 'carts#show', as: 'carts'
  delete '/cartsproduct/:id' => 'carts#delete'
  #get 'users/:id/products' => 'users#show', as: 'users/:id'

  resources :users do
    resources :products, :except => [:index]
  end
  resources :products, only: [:index]
  resources :carts
  resources :reviews
  resources :cartproducts

end
