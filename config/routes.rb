Rails.application.routes.draw do
  root to: 'customers#top'
  devise_for :admins
  devise_for :customers
  resources :customers do
    resources :curt_items, only: [:index, :destroy]
    get 'cart_items/confirm'
    resources :addresses, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :resigned_customers, only: [:create, :destroy]
  resources :items, only: [:index, :show]

  namespace :admin do
    resources :items
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
