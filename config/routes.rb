Rails.application.routes.draw do
  get 'products/new'
  root to: 'toppages#index'
  resources :users, only: [:index]
  resources :creditcards, only: [:new]
end
