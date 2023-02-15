Rails.application.routes.draw do
  devise_for :users
  root to: "finances#new"
  resources :finances, only: [:index]
  resources :genres, only: [:new, :create, :index]
  get 'setting', action: :setting, controller: 'finances'
end
