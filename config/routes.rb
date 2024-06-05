Rails.application.routes.draw do
  devise_for :users

  # Favourites routes
  resources :favourites, only: [:index, :create, :destroy]
  # HUGH'S CODE
  # get 'favourites/index', to: 'favourites#index', as: 'favourites'
  # get 'favourites/create'
  # get 'favourites/destroy'


  # Consultations routes
  # resources :consultations, only: [:index, :new, :create, :edit, :update, :destroy]
  # HUGH'S CODE
  # get 'consultations/index', to: 'consultations#index', as: 'consultations'
  # get 'consultations/new'
  # get 'consultations/create'
  # get 'consultations/edit'
  # get 'consultations/update'
  # get 'consultations/destroy'
  resources :consultations, only: :index

  resources :properties do
    resources :consultations, only: [:new, :create]
  end

  # HUGH'S CODE THAT WE WILL KEEP
  root to: "pages#home"

  # HUGH'S CUSTOM ROUTES THAT I AM UNSURE WHETHER WE WILL KEEP
  get '/user_bookings', to: 'bookings#user_bookings', as: 'user_bookings'
  get '/user_properties', to: 'properties#user_properties', as: 'user_properties'
  get "search_result", to: 'properties#search_result', as: 'search_result'
  #get '/user_properties/property_bookings', to: 'bookings#property_bookings', as: 'property_bookings'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end
