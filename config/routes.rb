Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :deities,     only: [:index, :show]
  resources :mythologies, only: [:index, :show]
  resources :users,       only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
