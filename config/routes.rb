require "monban/constraints/signed_in"


Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root "homes#show"

  resource :session, only: [:new, :create, :destroy]
  resource :users

  resources :maps, only: [:show]
  resources :locations, only: [:show, :create, :index, :edit, :destroy]
  get '/nearfields', to: 'near_fields#index', as: :near_fields
  get '/neargames', to: 'events#nearby', as: :near_games

  resources :events do
    resources :bookings
  end
end
