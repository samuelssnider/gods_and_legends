Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :deities,     only: [:index, :show]
  resources :mythologies, only: [:index, :show]
  resources :users,       only: [:new, :create]
  get '/login', to: 'sessions#new'
end
