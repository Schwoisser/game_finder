Rails.application.routes.draw do

  resources :invitations
  devise_for :users
  root "main#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "elements", to: "main#elements"
  
  get "/profile", to: "profile#show"
  # Reihenfolge beachten
  get "/profile/edit", to: "profile#edit"
  post "/profile/edit", to: "profile#update"
  post "/profile/add_game", to: "profile#add_game"
  patch "/profile/add_game", to: "profile#add_game"
  patch "/profile/remove_game", to: "profile#remove_game"
  post "/profile/send_friend_request", to: "profile#send_friend_request"
  get "/profile/:id", to: "profile#show"

  # matchmaking
  get "/play", to:"player_finder#index"
  # get "/matchmaking", to:"match_finder#index"


  post "/tournaments/join", to: "tournaments#join"
  post "/tournaments/leave", to: "tournaments#leave"
  
  get "/tournaments/:id/edit_pairing", to: "pairings#index"

  get "/tournaments/:tournament_id/pairing/new", to: "pairings#new"
  post "/tournaments/:tournament_id/pairing/create", to: "pairings#create"

  get "/tournaments/:tournament_id/pairing/:match_id/edit", to: "pairings#edit"
  patch "/tournaments/:tournament_id/pairing/:match_id/update", to: "pairings#update"

  get "/tournaments/:tournament_id/pairing/:match_id/delete", to: "pairings#delete"

  post "/tournaments/:tournament_id/pairing/pair", to: "pairings#pair"


  post "/tournaments/:tournament_id/pairing/start_round", to: "pairings#start_round"
  post "/tournaments/:tournament_id/pairing/end_round", to: "pairings#end_round"
  post "/tournaments/:tournament_id/pairing/end_tournament", to: "pairings#end_tournament"

  post "/tournaments/start_round", to: "tournaments#start_round"
  resources "tournaments"


  patch "/match/match_scoring", to: "match#match_scoring"
  post "/match/match_scoring", to: "match#match_scoring"
  


  resources "match"
  get "invite/:id", to: "match#invite"
  get "accept_invite/:id", to: "match#accept_invite"
  resources "message"
  post "/message/answer_friend_request", to: "message#answer_friend_request"
  resources "armies"
  resources "battle_reports"

  

  # resources "player_groups"

end
