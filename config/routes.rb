Rails.application.routes.draw do

  resources :user_reviews
  root 'static_pages#home'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/cart' => 'carts#show', as: 'carts'
  post '/carts/:id' => 'carts#add_to_cart'
  delete '/cartsproduct/:id' => 'cartproducts#delete', as: 'remove'
  get '/users/:id/products' => 'users#show'
  get '/products/reviewed' => 'products#reviewed'


  resources :users, except: [:show] do
    resources :products
  end
  resources :products
  resources :carts, only: [:show, :destroy]
  resources :reviews, except: [:show]
  resources :cartproducts, only: [:show]

end

