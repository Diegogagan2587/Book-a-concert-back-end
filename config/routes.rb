Rails.application.routes.draw do
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/all_users", to: "users#index"
  get "/concerts", to: "concerts#index"
  get "/concerts/:id", to: "concerts#show"
  post "/concerts", to: "concerts#create"
  delete "/concerts/:id", to: "concerts#destroy"
end
