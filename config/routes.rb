Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root to: "pages#home"

  #pages
  # get "home", to: "pages#home"  IF WE DO A STATIC HOME PAGE (PEC)

  get "dashboard", to: "pages#dashboard"
  patch "bookings/:id/accept", to: "bookings#accept", as: :accept_booking

  # Flats and nested bookings
  resources :flats do
    resources :bookings, only: [:create, :index, :show, :destroy,]
  end

  # needed for CRUD
  resources :bookings, only: [:show, :edit, :update, :destroy ]
end
