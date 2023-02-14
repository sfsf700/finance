Rails.application.routes.draw do
  devise_for :users
  root to: "finances#new"
  get 'setting', action: :setting, controller: 'finances'
end
