# config/routes.rb
Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create] # Add more actions as needed
      resources :likes, only: [:new, :create] # Add more actions as needed
    end
  end

  resources :posts, only: [:index, :show] 
  get "up" => "rails/health#show", as: :rails_health_check
end
