Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :activities do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[show edit update destroy]
  # TODO: Include nested resources :bookings only: %i[index] in users controller
end
