Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :deities,     only: [:index, :show]
  resources :mythologies, only: [:index, :show]
  resources :users,       only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
  
  namespace :api do
    namespace :v1 do
      resources :deities, only: [:index, :show]
    end
  end
end
