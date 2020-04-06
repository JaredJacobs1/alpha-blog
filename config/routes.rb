Rails.application.routes.draw do
  root "pages#home"

  #Set up a route to the "about" page
  get "about", to: "pages#about"
end
