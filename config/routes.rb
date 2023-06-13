Rails.application.routes.draw do
  root 'welcome#index'

  get 'dashboard', to: 'pages#dashboard'

  resources :challenges, only: [:show, :new, :create] do
    resources :posts, only: [:new, :create]
  end

  # this is the modification:
  resources :posts, only: [:index, :show], as: :feed

  get 'user_categories/new', to: 'user_categories#new'
  post 'user_categories', to: 'user_categories#create'
  get 'user/:id/edit', to: 'user_categories#edit', as: 'user'
  patch 'user_categories/:id', to: 'user_categories#update', as: 'update_user_category'

  devise_for :users, controllers: { registrations: "users/registrations" }
end
