Rails.application.routes.draw do
  devise_for :users
  resources :public_pages do
    get 'home', on: :collection
  end
end
