Rails.application.routes.draw do

  resources :invitations
  devise_for :users
  root "main#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "/profile", to: "profile#show"
  # Reihenfolge beachten
  get "/profile/edit", to: "profile#edit"
  post "/profile/edit", to: "profile#update"
  post "/profile/add_game", to: "profile#add_game"
  patch "/profile/add_game", to: "profile#add_game"
  
  get "/profile/:id", to: "profile#show"
  resources "match"
  resources "message"
  resources "tournaments"
  resources "armies"
  resources "battle_reports"

  post "/tournaments/join", to: "tournaments#join"
  post "/tournaments/leave", to: "tournaments#leave"
  post "/tournaments/pair", to: "tournaments#pair"
  post "/tournaments/start_round", to: "tournaments#start_round"
  # resources "player_groups"

end
