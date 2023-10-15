Rails.application.routes.draw do
  root to: 'home#index'

  resources :genres, only: [:index, :new, :create, :edit, :update, :show]
  resources :directors, only: [:index, :new, :create, :edit, :update, :show]
  resources :films, only: [:index, :new, :create, :edit, :update, :show] do
    patch :publish, on: :member
    patch :draft, on: :member
  end
end
