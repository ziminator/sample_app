Rails.application.routes.draw do
  devise_for :users

  #devise_for :users, path_names: { sign_up: :signup, sign_in: :login, sign_out: :logout }
  #devise_for :users, path_names: { sign_in: :login, sign_out: :logout }

  root    'static_pages#home'
  get     '/help',    to: 'static_pages#help'
  get     '/about',   to: 'static_pages#about'
  get     '/contact', to: 'static_pages#contact'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'

  #get     '/signup',  to: 'users#new'
  #get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
