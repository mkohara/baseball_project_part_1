Rails.application.routes.draw do
  # Routes for the Favorite resource:
  # CREATE
  get "/favorites/new", :controller => "favorites", :action => "new"
  post "/create_favorite", :controller => "favorites", :action => "create"

  # READ
  get "/favorites", :controller => "favorites", :action => "index"
  get "/favorites/:id", :controller => "favorites", :action => "show"

  # UPDATE
  get "/favorites/:id/edit", :controller => "favorites", :action => "edit"
  post "/update_favorite/:id", :controller => "favorites", :action => "update"

  # DELETE
  get "/delete_favorite/:id", :controller => "favorites", :action => "destroy"
  #------------------------------

  devise_for :scouts
  # Routes for the Scout resource:
  # READ
  get "/scouts", :controller => "scouts", :action => "index"
  get "/scouts/:id", :controller => "scouts", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
