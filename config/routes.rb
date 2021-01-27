Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show, :new, :create]
  resources :users, only: [:create, :show, :new]
  resources :neighborhoods, only: [:index]
  resources :cuisines, only: [:index]
end
