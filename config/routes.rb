Rails.application.routes.draw do
  # resources :likes
  # resources :posts
  # resources :comments
  # resources :users
  # # root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show]
  end
  root 'users#index'
end
