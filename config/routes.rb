Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :deities,     only: [:index, :show]
  resources :mythologies, only: [:index, :show]
end
