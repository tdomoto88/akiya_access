Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"

  devise_for :users

  resources :consultations, only: :index

  resources :favourites, only: [:index, :destroy]

  resources :properties do
    resources :consultations, only: [:new, :create]
    resources :favourites, only: :create
  end

  get "/user_properties", to: 'properties#user_properties', as: 'user_properties'

  get "/faqs", to: 'pages#faqs', as: 'faqs'

  get "/services", to: 'pages#services', as: 'services'

  get "/user_properties/edit", to: "properties#edit"

  patch "/user_properties", to: "properties#update"

end

# HUGH'S CUSTOM ROUTES THAT I AM UNSURE WHETHER WE WILL KEEP
# get '/user_bookings', to: 'bookings#user_bookings', as: 'user_bookings'
# get "search_result", to: 'properties#search_result', as: 'search_result'
#get '/user_properties/property_bookings', to: 'bookings#property_bookings', as: 'property_bookings'
