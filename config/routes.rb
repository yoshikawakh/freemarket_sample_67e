Rails.application.routes.draw do
  root to: 'toppages#index'
  resources :users, only: [:index]
  resources :creditcards, only: [:new]
  resources :products, only: [:new]
end
