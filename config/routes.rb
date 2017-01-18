Rails.application.routes.draw do

  root to: 'directives#index', as: '/'

  resources :hunts, :directives, :submissions, :users, :teams, :team_players

  get '/hunts/find/:name', to: 'hunts#find'

  get '/user/find/:email', to: 'users#find'

  get '/directives/find/:hunt_id', to: 'directives#find'

  get '/teams/find/:hunt_id', to: 'teams#find'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
