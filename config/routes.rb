Rails.application.routes.draw do
  devise_for :users
  root to: "records#new"
  resources :records, only: [:index, :new, :create]
  resources :spendings, only: [:new, :create]
  resources :genres, only: [:new, :create, :index, :destroy]
  get 'setting', action: :setting, controller: 'genres'
end
