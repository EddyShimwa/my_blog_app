Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[create]
    end
  end
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'create_post_like'
  post '/posts/:post_id/comments', to: 'comments#create', as: 'create_post_comment'

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index show] do
          resources :comments, only: %i[index show create update destroy]
        end
      end
    end
  end
end
