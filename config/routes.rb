Rails.application.routes.draw do

  root to: 'directives#index', as: '/'

  resources :hunts, :directives, :submissions, :users, :teams, :teamplayers

  # Finder routes for hunts
  get '/hunts/find/name/:name', to: 'hunts#find_by_name'

  get '/hunts/find/organizer/:organizer_id', to: 'hunts#find_by_organizer'

  get '/hunts/find/player/:player_id', to: 'hunts#find_by_player'

  # Finder routes for users
  get '/users/find/firebase/:firebase', to: 'users#find_by_firebase'

  get '/users/find/team/:team_id', to: 'users#find_by_team'

  get '/users/find/email/:email', to: 'users#find_by_email'

  # Finder routes for directives
  get '/directives/find/:hunt_id', to: 'directives#find'

  # Finder routes for submissions
  get '/submissions/find/:team_id/:directive_id', to: 'submissions#find_by_team_and_directive'

  get '/submissions/hunt/:hunt_id', to: 'submissions#find_by_hunt'

  # Finder routes for teams
  get '/teams/find/:hunt_id', to: 'teams#find_by_hunt_id'

  get '/teams/find/:hunt_id/:player_id', to: 'teams#find_by_hunt_and_player'

  # Find routes for teamplayers
  get '/teamplayers/find/:team_id/:player_id', to: 'teamplayers#find'

end
