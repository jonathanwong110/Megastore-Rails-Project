Rails.application.routes.draw do

  root 'static_pages#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/cart' => 'carts#show', as: 'carts'
  delete '/cartsproduct/:id' => 'carts#delete'
  get '/users/:id/products' => 'users#show'
  get '/products/reviewed' => 'products#reviewed'


  resources :users, except: [:show] do
    resources :products
  end
  resources :products
  resources :carts
  resources :reviews
  resources :cartproducts

end
