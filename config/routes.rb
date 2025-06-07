Rails.application.routes.draw do
  root "places#index"
  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :places, only: [:index, :show, :new, :create] do
    resources :entries, only: [:new, :create]
  end
end
