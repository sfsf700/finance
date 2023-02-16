Rails.application.routes.draw do
  devise_for :users
  root to: "records#new"
  resources :records, only: [:index, :new, :create]
  resources :spendings, only: [:new, :create]
  resources :genres, only: [:new, :create, :index]
  get 'setting', action: :setting, controller: 'records'
end
