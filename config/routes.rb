Rails.application.routes.draw do
  resources :factoids, only: [:index]
  resources :quotes, only: [:new, :create, :destroy]
  root 'visitors#index'
end
