Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :deities,     only: [:index, :show]
  resources :mythologies, only: [:index, :show]
  resources :users,       only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
  
  get 'api/dashboard', to: 'api#dashboard'
  namespace :api do
    namespace :v1 do
      resources :deities, only: [:index, :show] do
        get 'mythology', to: 'deities/mythologies#index'
        get 'events', to: 'deities/events#index'
        get 'parents', to: 'deities/parents#index'
        get 'children', to: 'deities/children#index'
      end
    end
  end
end
