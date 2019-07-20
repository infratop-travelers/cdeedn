Rails.application.routes.draw do
  root to: 'customers#top'
  devise_for :admins
  devise_for :customers

  resources :customers do
    resources :cart_items, only: [:index, :create, :destroy]
    get 'cart_items/confirm'
    resources :addresses, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :items, only: [:index, :show]

  namespace :admin do
    resources :items
    resources :item_kinds, only: [:index]
    resources :home, only: [:index]
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :resigned_customers, only: [:create,:update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
