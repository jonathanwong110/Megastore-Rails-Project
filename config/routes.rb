Rails.application.routes.draw do

  root 'static_pages#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/cart' => 'carts#show', as: 'carts'
  delete '/cartsproduct/:id' => 'carts#delete'

  resources :users do
    resources :products, :except => [:index, :create]
  end
  resources :products, only: [:index, :create]
  resources :carts
  resources :reviews
  resources :cartproducts

end
