Rails.application.routes.draw do

  root to: 'directives#index', as: '/'

  resources :hunts, :directives, :submissions, :users, :teams

  get '/hunts/find/:name', to: 'hunts#find'

  get '/user/find/:email', to: 'users#find'

  get '/directives/find/:hunt_id', to: 'directives#find'

#routes for hunts and directives belonging to hunts
  #routes for submissions belonging to directives
  # resources :hunts do
  #   resources :directives do
  #     resources :submissions
  #   end
  # end

#routes for organizers and the hunts that belong to them
  # resources :organizers do
  #   resources :hunts
  # end

  #routes for hunts, teams and players
  # resources :hunts do
  #   resources :teams do
  #     resources :players
  #   end
  # end

  #routes for players and their submissions
  # resources :players do
  #   resources :submissions
  # end



  # get 'submissions/index'
  #
  # get 'submissions/new'
  #
  # get 'submissions/show'
  #
  # get 'submissions/update'
  #
  # get 'submissions/destroy'
  #
  # get 'submissions/edit'
  #
  # get 'submissions/create'
  #
  # get 'directives/index'
  #
  # get 'directives/new'
  #
  # get 'directives/show'
  #
  # get 'directives/update'
  #
  # get 'directives/destroy'
  #
  # get 'directives/edit'
  #
  # get 'directives/create'
  #
  # get 'hunts/index'
  #
  # get 'hunts/new'
  #
  # get 'hunts/show'
  #
  # get 'hunts/update'
  #
  # get 'hunts/destroy'
  #
  # get 'hunts/edit'
  #
  # get 'hunts/create'
  #
  # get 'organizers/index'
  #
  # get 'organizers/new'
  #
  # get 'organizers/show'
  #
  # get 'organizers/update'
  #
  # get 'organizers/destroy'
  #
  # get 'organizers/edit'
  #
  # get 'organizers/create'
  #
  # get 'teams/index'
  #
  # get 'teams/new'
  #
  # get 'teams/show'
  #
  # get 'teams/update'
  #
  # get 'teams/destroy'
  #
  # get 'teams/edit'
  #
  # get 'teams/create'
  #
  # get 'players/index'
  #
  # get 'players/new'
  #
  # get 'players/show'
  #
  # get 'players/update'
  #
  # get 'players/destroy'
  #
  # get 'players/edit'
  #
  # get 'players/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
