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


  get 'user_categories/new', to: 'user_categories#new'
  post 'user_categories', to: 'user_categories#create'
  get 'user_categories/:id/edit', to: 'user_categories#edit', as: 'edit_user_category'
  patch 'user_categories/:id', to: 'user_categories#update', as: 'update_user_category'


  devise_for :users, controllers: { registrations: "users/registrations" }


end
