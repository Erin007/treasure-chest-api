Rails.application.routes.draw do

  root to: 'directives#index', as: '/'

  resources :hunts, :directives, :submissions, :users, :teams, :teamplayers

  # Finder routes for hunts
  get '/hunts/find/name/:name', to: 'hunts#find_by_name'

  get '/hunts/find/organizer/:organizer_id', to: 'hunts#find_by_organizer'

  get '/hunts/find/player/:player_id', to: 'hunts#find_by_player'

  # Finder routes for users
  get '/user/find/firebase/:firebase', to: 'users#find_by_firebase'

  get '/user/find/team/:team_id', to: 'users#find_by_team'

  # Finder routes for directives
  get '/directives/find/:hunt_id', to: 'directives#find'

  # Finder routes for teams
  get '/teams/find/:hunt_id', to: 'teams#find'

end
