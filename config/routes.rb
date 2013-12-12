Resplendent::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  get "/" => "static#home"
  get "/affiliates" => "static#affiliates"
  get "/home" => "static#home"
  get "/about" => "static#about"
  root "static#home"
  
  get "/signup" => "users#new"
  get "/signin" => "sessions#new"
  get "/signout" => "sessions#destroy"

  # Create admin namespace, route to admin controller
  namespace :admin do
    get "/admin" => "admin#index"  
  end

end