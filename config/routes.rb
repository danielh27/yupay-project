Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :products
  resources :customers

  resources :suppliers, only: %i[create]

  resources :purchases, only: %i[new create show destroy] do
    member do
      post 'confirm'
    end
    resources :list_purchases, only: %i[index new create]
  end

  resources :list_purchases, only: %i[destroy]

  resources :orders, only: %i[new create show destroy] do
    member do
      post 'confirm'
    end
    resources :list_orders, only: %i[index new create]
  end
  get '/kpis', to: 'pages#kpis'
end
