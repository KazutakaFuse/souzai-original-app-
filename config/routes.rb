Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create, :show, :edit, :destroy]
  
  # resources :items do
  #   resource :reviews, :except => :destroy
  #   member do
  #       delete  'reviews'
  #   end
  #   resources :reviews, only: [:destroy]
  #   end
  
  resources :items , shallow: true do
    resources :reviews
  end
end