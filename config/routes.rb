Rails.application.routes.draw do
  root to: 'static_pages#home'
  get '/sitemaps', to: 'sitemaps#index', format: 'xml'
  get 'about', to: 'static_pages#about'
  get 'pricing', to: 'static_pages#pricing'

  resource :feedback, path: :contact_us, only: [:create, :new]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  namespace :account do
    resources :gifts
    resources :users, except: [:create, :new]
    resource :organization,
              only: [:edit, :update],
              controller: :organization
    resources :organization_gifts, path: :rewards, only: [:index, :show]
    resource  :profile,
              only: [:edit, :update],
              controller: :profile
    resources :favorite_gifts, only: [:index, :create, :destroy]

    resources :notifications, only: :index
  end

  resources :posts

  namespace :admin do
    resources :organizations, only: [:index, :show]
    root to: 'admin#index'

    resources :feedbacks, only: [:index, :show]

  end
end
