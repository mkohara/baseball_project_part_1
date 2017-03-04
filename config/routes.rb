Rails.application.routes.draw do
  devise_for :scouts
  # Routes for the Scout resource:
  # READ
  get "/scouts", :controller => "scouts", :action => "index"
  get "/scouts/:id", :controller => "scouts", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
