require "monban/constraints/signed_in"


Rails.application.routes.draw do
constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root "homes#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :locations, only: [:show, :create, :index, :edit, :destroy]

  resources :borough, only: [:new, :create, :show] do
    resources :fields, only: [:new, :create]
  end
end



