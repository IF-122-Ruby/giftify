Rails.application.routes.draw do
  root to: 'static_pages#home'
  get '/contact_us', to: 'feedbacks#new'
  get 'about', to: 'static_pages#about'

  
  resource :feedback, path: :contact_us, only: :create

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
