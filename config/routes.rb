Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :create, :new]
  resources :users, only: :new
  root to: "items#index"
end
