Rails.application.routes.draw do
    devise_for :users
    root 'foods#index'
    resources :foods, only: [:index, :show, :new, :create, :destroy]

    resources :recipes do
        member do
            patch :toggle_public
        end
        resources :recipe_foods, only: [:new, :create, :destroy]
    end
    resources :users, only: [:index, :show, :new, :create]
    resources :public_recipes, only: [:index]
    resources :shopping_lists, only: [:index] do
        collection do
            get 'generate'
        end
    end
end
