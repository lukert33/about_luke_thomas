Rails.application.routes.draw do
  resources :factoids, only: [:index, :new, :create, :destroy]
end
