Rails.application.routes.draw do
  root    'static_pages#home'

  devise_for :users, path: :/, path_names: { sign_in: :login, sign_up: :signup, sign_out: :logout }

  get     '/help',    to: 'static_pages#help'
  get     '/about',   to: 'static_pages#about'
  get     '/contact', to: 'static_pages#contact'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
