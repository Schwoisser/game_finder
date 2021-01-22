Rails.application.routes.draw do
  devise_for :users
  root "main#index"

  get 'tournament/index'
  get 'tournament/new'
  get 'tournament/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/profile", to: "profile#show"
  resources "match"
  resources "message"

end
