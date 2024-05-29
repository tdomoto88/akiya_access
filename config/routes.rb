Rails.application.routes.draw do

  devise_for :users

  resources :properties do
    resources :bookings
  end
  get '/user_bookings', to: 'bookings#user_bookings', as: 'user_bookings'
  get '/user_properties', to: 'properties#user_properties', as: 'user_properties'
  #get '/user_properties/property_bookings', to: 'bookings#property_bookings', as: 'property_bookings'
  root to: "properties#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
