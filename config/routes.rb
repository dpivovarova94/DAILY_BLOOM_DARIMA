Rails.application.routes.draw do
  # root to: "pages#home"
  root 'welcome#index'

  get 'dashboard', to: 'pages#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :challenges, only: [:show, :new, :create] do
    resources :posts, only: [:new, :create]
  end

  get 'posts', to: 'posts#index', as: :feed
  get '/posts/:id', to: 'posts#show', as: 'post'
  delete '/posts/:id', to: 'posts#destroy', as: 'delete_post'


  get 'user_categories/new', to: 'user_categories#new'
  post 'user_categories', to: 'user_categories#create'
  get 'user/:id/edit', to: 'user_categories#edit', as: 'user'
  patch 'user_categories/:id', to: 'user_categories#update', as: 'update_user_category'


  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'wrapped', to: 'pages#wrapped'
  get 'challenge_success', to: 'challenges#success', as: :challenge_success

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
    end
  end

  get 'friendships/search', to: 'friendships#search', as: 'friendship_search'

  resources :friendship, only: [:create, :update]
end
