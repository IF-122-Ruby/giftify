Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :account do
    resources :users, only: [:index, :show]
    namespace :admin do
      resources :organizations, only: [:index, :show]
    end
  end
end
