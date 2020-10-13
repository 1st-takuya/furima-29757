Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :users, only: :new
  root to: "items#index"
end
