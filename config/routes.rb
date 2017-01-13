Rails.application.routes.draw do
  root to: 'directives#index', as: '/'

  resources :hunts do
    resources :directives
  end


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
