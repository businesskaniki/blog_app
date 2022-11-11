Rails.application.routes.draw do
  devise_for :views
  devise_for :models
  # resources :likes
  # resources :posts
  # resources :comments
  # resources :users
  # # root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create]
  end
  root 'users#index'

  get "/users/:id/posts/:id/new" => "comments#new", as: 'new_user_post_comment'
  post "/users/:id/posts/:id" => "comments#create", as: 'user_post_comments'
  post "/users/:id/posts/:id/likes" => "likes#create", as: 'user_post_likes'
end
