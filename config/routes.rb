Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :activities do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[index show edit update destroy]

  resources :users, only: %i[show edit update destroy]

  get 'users/:id/activities/offered', to: 'activities#offered' , as: :offered
  get 'users/:id/bookings/requested', to: 'bookings#requested', as: :requested
end
