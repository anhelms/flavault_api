Rails.application.routes.draw do
  get "/recipes" => "recipes#index"
  post "/recipes" => "recipes#create"
end
