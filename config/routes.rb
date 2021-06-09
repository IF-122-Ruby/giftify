Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

  resource :feedback, path: :contact_us, only: [:create, :new]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :account do
    resources :users, except: [:create, :new]
  end
  
  namespace :admin do
    resources :organizations, only: [:index, :show]
  end
end
