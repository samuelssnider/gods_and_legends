Rails.application.routes.draw do
  root to: 'dashboard#index'
  resources :deities,     only: [:index, :show]
  resources :mythologies, only: [:index, :show]
  resources :events,      only: [:index, :show]
  resources :domains,     only: [:index, :show]
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
      resources :mythologies, only: [:index, :show] do
        get 'deities', to: 'mythologies/deities#index'
      end
      resources :events, only: [:index, :show] do
        get 'deities', to: 'events/deities#index'
      end
      post '/domains', to: 'domains#create'
      resources :domains, only: [:index, :show] do
        get 'deities', to: 'domains/deities#index'
      # delete '/domains', to: 'domains#destroy'
      end
      
    end
  end
  
  get "mythologies/:name/deities"          => "mythologies/deities#index"
end
