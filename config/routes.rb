Rails.application.routes.draw do
  root "pages#home"

  #Set up a route to the "about" page
  get "about", to: "pages#about"

  resources :articles, only: [:show, :index]
end
