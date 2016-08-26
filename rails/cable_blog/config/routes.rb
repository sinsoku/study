Rails.application.routes.draw do
  resources :organizations
  get 'home/index'

  devise_for :users
  root to: 'home#index'
end
