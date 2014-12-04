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

end
