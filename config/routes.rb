Rails.application.routes.draw do
  get 'restaurants/show'
  devise_for :users
  root to: "pages#home"

  resources :activities do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[index show edit destroy]
  patch 'bookings/:id', to: 'bookings#update', as: :update_booking

  resources :users, only: %i[show edit update destroy]

  get 'users/:id/activities/offered', to: 'activities#offered' , as: :offered
  get 'users/:id/bookings/requested', to: 'bookings#requested', as: :requested

  resources :restaurants, only: %i[index show new create delete]
end
