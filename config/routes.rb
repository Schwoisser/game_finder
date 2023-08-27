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

  patch "/profile/add_game/", to: "profile#add_game"
  get "/profile/remove_game/:id", to: "profile#remove_game"

  patch "/profile/add_language/", to: "profile#add_language"
  get "/profile/remove_language/:id", to: "profile#remove_language"


  post "/profile/send_friend_request", to: "profile#send_friend_request"
  get "/profile/:id", to: "profile#show"

  # matchmaking
  get "/play", to:"player_finder#index"
  get "/matchmaking", to:"match_finder#index"


  # post "/tournaments/join", to: "tournaments#join"
  # post "/tournaments/leave", to: "tournaments#leave"
  
  # get "/tournaments/:id/edit_pairing", to: "pairings#index"

  # get "/tournaments/:tournament_id/pairing/new", to: "pairings#new"
  # post "/tournaments/:tournament_id/pairing/create", to: "pairings#create"

  # get "/tournaments/:tournament_id/pairing/:match_id/edit", to: "pairings#edit"
  # patch "/tournaments/:tournament_id/pairing/:match_id/update", to: "pairings#update"

  # get "/tournaments/:tournament_id/pairing/:match_id/delete", to: "pairings#delete"

  # post "/tournaments/:tournament_id/pairing/pair", to: "pairings#pair"


  # post "/tournaments/:tournament_id/pairing/start_round", to: "pairings#start_round"
  # post "/tournaments/:tournament_id/pairing/end_round", to: "pairings#end_round"
  # post "/tournaments/:tournament_id/pairing/end_tournament", to: "pairings#end_tournament"

  # post "/tournaments/start_round", to: "tournaments#start_round"
  resources "tournaments"

  get "/player_rating/:user_id/:match_id/:match_scoring_id/:player_attribute_id", to: "player_rating#create"

  get "/set_as_rated/:match_scoring_id", to: "player_rating#set_as_rated"

  patch "/match/match_scoring", to: "match#match_scoring"
  post "/match/match_scoring", to: "match#match_scoring"
  


  # TODO join match route
  resources "match"
  get "match/:id/delete_ask", to: "match#delete_ask"
  get "match/:id/delete", to: "match#delete"
  get "invite/:id", to: "match#invite"
  get "accept_invite/:id", to: "match#accept_invite"
  get "decline_invite/:id", to: "match#decline_invite"

  get "join_match/:id", to: "match#join_match"


  get "match_user_manager/accept_pending_user/:id", to: "match_user_manager#accept_pending_user"
  get "match_user_manager/delete_match_scoring/:id", to: "match_user_manager#delete_match_scoring"
  get "match_user_manager/invite_user_to_match/:user_id/:match_id", to: "match_user_manager#invite_user_to_match"

  get "message/send_to/:id", to: "messages#send_to"
  get "messages", to: "messages#show"
  resources "messages"

  post "/message/answer_friend_request", to: "messages#answer_friend_request"
  patch "/message/answer_friend_request", to: "messages#answer_friend_request"
  resources "armies"
  resources "battle_reports"

  get "match_scoring/:id/decline_rating", to: "match_scorings#decline_rating"
  resources "match_scorings"

  get "abuse_reports/new", to: "abuse_reports#new"
  post "abuse_reports/new", to: "abuse_reports#create"

  resources "dev_notes"

  get "imprint", to: "impressum#imprint"
  get "privacy_policy", to: "impressum#privacy_policy"

  # resources "player_groups"

end
