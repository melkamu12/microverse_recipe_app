Rails.application.routes.draw do
root 'foods#index'
resources :food, only: [:index, :new, :create] do
  resources :recipe, only: [:index, :new, :create]
end

resources :users, only: [:index, :show, :new, :create]
resources :recipe_food, only: [:index, :new, :create]
resources :recipe, only: [:index, :new, :create]
end
  