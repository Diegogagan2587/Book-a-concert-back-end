Rails.application.routes.draw do
  get "/users", to: "users#index"
  get "/concerts", to: "concerts#index"
  get "/concerts/:id", to: "concerts#show"
  get "/reservations", to: "reservations#index"

  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/concerts", to: "concerts#create"
  post '/reservations', to: 'reservations#create'

  delete "/logout", to: "sessions#destroy"
  delete "/concerts/:id", to: "concerts#destroy"
end
