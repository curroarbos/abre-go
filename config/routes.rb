Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :activities do
    resources :config_time_slots, only: %i[show new create], shallow: true do
      resources :days_time_slots, only: %i[new create], shallow: true
    end
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[index show edit destroy]
  patch 'bookings/:id', to: 'bookings#update', as: :update_booking

  resources :users, only: %i[show edit update destroy]

  get 'users/:id/activities/offered', to: 'activities#offered' , as: :offered
  get 'users/:id/bookings/requested', to: 'bookings#requested', as: :requested

  resources :restaurants, only: %i[index show new create delete]
  resources :properties, only: %i[show new create] do
    resources :recommendations, only: %i[index new create]
  end
  resources :recommendations, only: :destroy
  post '/properties/:property_id/recommendations', to: 'recommendations#create', as: :create_recommendation

end
