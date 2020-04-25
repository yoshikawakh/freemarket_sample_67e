Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'toppages#index'
  resources :users, only: [:index] do
    collection do
      get 'logout'
    end
  end
  resources :creditcards, only: [:new]
  resources :products, only: [:new]
end
