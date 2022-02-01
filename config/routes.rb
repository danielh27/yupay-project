Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :products
  resources :warehouses
  resources :customers
  resources :orders
  resources :purchases
  resources :basket
  get '/kpis', to: 'pages#kpis'
  
end
