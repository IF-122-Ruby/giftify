Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'static_pages#home'
  get '/sitemaps', to: 'sitemaps#index', format: 'xml'
  get 'about', to: 'static_pages#about'
  get 'pricing', to: 'static_pages#pricing'
  get 'help', to: 'articles#help'
  mount ActionCable.server, at: '/cable'

  resource :feedback, path: :contact_us, only: [:create, :new]
 
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  resources :accept_invites, only: %i[new create]

  namespace :account do
    get '/search', to: 'search#search', as: 'search'
    get 'dima_search', to: 'dima_search#index'
    resources :microposts, path: :feed, except: [:show]
    resources :microposts, path: :feed, only: [:show] do
      resources :comments, only: [:create, :destroy]
    end
    resources :comments, only: :destroy
    resources :gifts
    resources :users, except: [:create, :new] do
      get 'export', on: :collection, defaults: { format: 'csv' }
    end
    resource  :organization,
              only: [:edit, :update],
              controller: :organization
    resource  :profile,
              only: [:show, :edit, :update],
              controller: :profile
    resources :organization_gifts, path: :rewards, only: [:index, :show]
    resources :gifts, path: :rewards, only: [:show] do
      resources :comments, only: [:create, :destroy]
    end
    resources :invites, except: %i[edit update]
    resources :notifications, only: :index do
      post 'mark_all_as_read', on: :member
    end
    resources :reactions, only: [:create, :destroy]
    resources :favorite_gifts, only: [:index, :create, :destroy]
    resources :my_gifts, only: [:index, :show] do
      member do
        post 'receive'
      end
    end
    get '/telegram_profile/connect', to: 'telegram_profiles#create'

    resource :transaction, only: [:create, :new], controller: :transaction
    resources :charts, only: [:index]
  end

  resources :posts

  namespace :admin do
    root to: 'admin#index'
    resources :articles, only: [:update, :edit]
    resources :organizations, only: [:index, :show]
    resources :feedbacks, only: [:index, :show]
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resource  :user, only: [:show]
      resources :my_gifts, only: [:index, :show]
      resources :dima_search, only: [:index]
    end
  end

  telegram_webhook TelegramBotController
end
