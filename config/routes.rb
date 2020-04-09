Rails.application.routes.draw do
  root to: 'accounts#index'
  resources :accounts, only:[:index, :edit, :update, :destroy]
end
