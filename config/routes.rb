Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'}
  get 'users/edit'
  get 'users/update'

  root to: "records#new"
  resources :users, param: :name, path: "/", only:  [:edit, :update, :destroy]
  resources :records, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :genres, only: [:index, :new, :create, :destroy]
  get 'setting', action: :setting, controller: 'genres'
  get 'csv', action: :csv, controller: 'genres'
end
