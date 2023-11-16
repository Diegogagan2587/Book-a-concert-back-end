Rails.application.routes.draw do
  get "/users", to: "users#index"
  get "/current_user", to: "application#current_user"
  get "/current_user/concerts", to: "concerts#current_user_concerts"
  get "/current_user/reservations", to: "reservations#current_user_reservations"
  get "/concerts", to: "concerts#index"
  get "/concerts/:id", to: "concerts#show"
  get "/reservations", to: "reservations#index"
  get "/reservations/:id", to: "reservations#show"

  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/concerts", to: "concerts#create"
  post '/reservations', to: 'reservations#create'

  delete "/logout", to: "sessions#destroy"
  delete "/concerts/:id", to: "concerts#destroy"

  # DANGER ZONE 
  delete "/users", to: "users#delete_all_users"
  delete "/concerts", to: "concerts#delete_all_concerts"
  delete "/reservations", to: "reservations#delete_all_reservations"
end
