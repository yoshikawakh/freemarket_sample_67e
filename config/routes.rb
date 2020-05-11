Rails.application.routes.draw do
  root 'toppages#index'
  root to: 'accounts#index'
  resources "categorys", only: [:index]

end
