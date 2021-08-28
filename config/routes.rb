Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  resources  :prototypes, only: [:new, :index,:edit, :destroy, :show, :update, :create]

end
  