Rails.application.routes.draw do
  resources :factoids, only: [:index, :new, :create, :destroy]
  resources :quotes, only: [:new, :create, :destroy]
  root 'visitors#index'
end
