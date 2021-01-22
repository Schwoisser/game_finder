Rails.application.routes.draw do
  devise_for :users
  root "main#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "/profile", to: "profile#show"
  resources "match"
  resources "message"
  resources "tournament"

end
