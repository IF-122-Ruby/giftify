Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'roots#index'
  namespace :account do
    resources :users, only: [:index, :show]
  end
  
  namespace :superadmin do
    resources :organizations, only: [:index, :show]
  end
end
