Rails.application.routes.draw do
  get 'favourites/index', to: 'favourites#index', as: 'favourites'
  get 'favourites/create'
  get 'favourites/destroy'
  get 'consultations/index', to: 'consultations#index', as: 'consultations'
  get 'consultations/new'
  get 'consultations/create'
  get 'consultations/edit'
  get 'consultations/update'
  get 'consultations/destroy'
  devise_for :users
  resources :properties do
    resources :consultations, except: :index
  end
  get '/user_bookings', to: 'bookings#user_bookings', as: 'user_bookings'
  get '/user_properties', to: 'properties#user_properties', as: 'user_properties'
  #get '/user_properties/property_bookings', to: 'bookings#property_bookings', as: 'property_bookings'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "search_result", to: 'properties#search_result', as: 'search_result'
end
