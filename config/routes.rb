Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :account do
    resources :users, only: [:index, :show]
    resources :gifts
  end
  
  namespace :admin do
    resources :organizations, only: [:index, :show]
  end
end
