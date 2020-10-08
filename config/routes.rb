Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index]
  resources :user, only: :new
  root to: "items#index"
end
