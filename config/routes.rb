Rails.application.routes.draw do
  root "pages#home"

  #Set up a route to the "about" page
  get "about", to: "pages#about"

  # At this point, if we add ':destroy' to the route set, we have exposed all of the
  # REST-ful routes. There's no longer a reason to limit them with the 'only' array, as
  # in the line below. So, use the equivalent set provided in the uncommented line.
  #
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  #
  # REST is a mapping between CRUD and the HTTP verbs get, post, patch/put and delete.
  #
  resources :articles
end
