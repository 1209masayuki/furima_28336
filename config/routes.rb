Rails.application.routes.draw do
  get 'items/index'
  get 'items/new'
  get 'items/create'
  devise_for :users
  resources :items, only: [:index, :new, :create]
end
