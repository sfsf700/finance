Rails.application.routes.draw do
  devise_for :users
  root to: "records#new"
  resources :records, only: [:index, :new, :create]
  resources :genres, only: [:new, :create, :destroy]
  get 'setting', action: :setting, controller: 'genres'
  get 'chart', action: :chart, controller: 'genres'
end
