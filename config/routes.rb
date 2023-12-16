Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'users#index'

  resources :user, only: %i[index show] do
    resources :post, only: %i[index show new create] do
      resources :comments, only: [:create]
    end
  end

  put 'user/:user_id/post/:id/like', to: 'posts#like', as: 'like'
end