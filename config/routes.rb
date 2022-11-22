Rails.application.routes.draw do
  devise_for :users
  # get "users/:id", to: "users#dashboard"

  root to: "games#index"

  resources :games, except: :index do
    resources :reservations, only: [:new, :create, :index, :show]
  end
  # destroy a reservation
  resources :reservations, only: :destroy

  # get "pages", to: "pages#search"
end
