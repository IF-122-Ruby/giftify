Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

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
  end

  namespace :admin do
    resources :organizations, only: [:index, :show]
    root to: 'admin#index'

    resources :feedbacks, only: [:index, :show]

  end
end
