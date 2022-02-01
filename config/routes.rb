Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :products
  # resources :orders
  resources :warehouses
  resources :customers
  resources :purchases
  resources :basket
  get '/kpis', to: 'pages#kpis'
  # get '/orders/new', to: 'list_orders#new'
  # get '/orders', to: 'list_orders#create'
  resources :list_orders
end
