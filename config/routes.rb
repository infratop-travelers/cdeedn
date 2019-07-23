Rails.application.routes.draw do
  root to: 'items#index'
  get "customers/about" => "customers#about"
  devise_for :admins
  devise_for :customers

  resources :customers do
    resources :cart_items, only: [:index, :create, :destroy]
    resources :addresses, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :orders
  end
  
  resources :items, only: [:index, :show]

  namespace :admin do
    resources :items do
      resources :discs, only: [:create, :update, :destroy]
      resources :songs, only: [:create, :update, :destroy]
    end
    resources :orders, only: [:index, :update, :show]
    resources :item_kinds, only: [:index]
    resources :singers, only: [:create, :update, :destroy]
    resources :genres, only: [:create, :update, :destroy]
    resources :labels, only: [:create, :update, :destroy]
    resources :home, only: [:index]
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :resigned_customers, only: [:create,:update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
