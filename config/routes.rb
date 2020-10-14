# frozen_string_literal: true

# Feel free to change whatever you like regarding the routes.
# This is just an example

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :rooms, except: %i[create destroy] do
        resources :bookings
      end

      resources :bookings, except: :create do
        resources :participants, except: :update
      end
      resources :users
    end
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  post 'rooms/:room_id/bookings', to: 'bookings#create'
  patch 'bookings/:id', to: 'bookings#update'
  delete 'bookings/:id', to: 'bookings#destroy'
  post 'bookings/:booking_id/participants', to: 'participants#create'
  get 'rooms', to: 'rooms#index'
  get 'bookings', to: 'bookings#index'
end
