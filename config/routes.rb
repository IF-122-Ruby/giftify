Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'contact_us', action: :contact_us, controller: 'static_pages'
  post 'contact_us', action: :create, controller: 'static_pages'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :account do
    resources :users, only: [:index, :show]
  end
  
  namespace :admin do
    resources :organizations, only: [:index, :show]
  end
end
