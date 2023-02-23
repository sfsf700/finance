Rails.application.routes.draw do
  get 'users/edit'
  get 'users/update'
  devise_for :users
  root to: "records#new"
  resources :users, only:  [:edit, :update]
  resources :records, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :genres, only: [:index, :new, :create, :destroy]
  get 'setting', action: :setting, controller: 'genres'
  get 'csv', action: :csv, controller: 'genres'
end
