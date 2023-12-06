Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  post 'time_slots', to: 'time_slots#create', as: :create_time_slot
  devise_for :users
  root to: "pages#home"

  resources :activities do
    resources :config_time_slots, only: %i[show new create], shallow: true do
      resources :days_time_slots, only: %i[new create destroy], shallow: true
    end
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[index show edit destroy]
  patch 'bookings/:id', to: 'bookings#update', as: :update_booking

  resources :users, only: %i[show edit update destroy]

  get 'users/:id/activities/offered', to: 'activities#offered' , as: :offered
  get 'users/:id/bookings/requested', to: 'bookings#requested', as: :requested

  resources :restaurants, only: %i[show]
  resources :properties, only: %i[index show new create] do
    resources :recommendations, only: %i[index new create]
  end
  resources :properties, only: %i[index show new create] do
    resources :restaurants, only: %i[new create]
  end

  resources :recommendations, only: :destroy
  post '/properties/:property_id/recommendations', to: 'recommendations#create', as: :create_recommendation

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :time_slots, only: [ :index ]
    end
  end
end
