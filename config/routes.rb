Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"

  get "fav_artist", to: "pages#fav_artist"
  get "diary", to: "pages#diary"
  get "my_history", to: "pages#my_history"
  get "secret", to: "pages#secret"
  get "update_content", to: "pages#update_content"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :articles, except: :show
end
