Rails.application.routes.draw do

   root 'users#index'
      resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :new, :create] do
      post 'like', to: 'likes#create', on: :member, as:
      :like_post
      resources :comments, only: [:create, :new]
   end 
    get 'posts', to: 'posts#index', on: :member, as:
    :user_posts
  end 
end
