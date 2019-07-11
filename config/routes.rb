Rails.application.routes.draw do
 
  namespace :api do
    namespace :v1 do
      resources :bookings
      resources :listings
      # resources :new_listings
      resources :users
      resources :hosts

      # post "/listings/:id/created", to: "listings#"
      # post "/new_listings/:id/created", to: "new_listings#"
      post "/login", to: "auth#login"
      get "/auto_login", to: "auth#auto_login"
    end
  end 
end