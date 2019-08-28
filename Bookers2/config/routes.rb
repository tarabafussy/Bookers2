Rails.application.routes.draw do
  devise_for :users
  get 'users/top'
  root 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :create, :edit, :new, :update]
  resources :books, only: [:show, :index, :create, :edit, :new, :update, :destroy]
end
