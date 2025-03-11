Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root to: "pages#home"

  resources :flats do
    resources :bookings, only: [:create, :index, :show]
  end

  # Standalone bookings routes for editing and deleting
  resources :bookings, only: [:edit, :update, :destroy]
end


