class TeamsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: {
      count: Team.count,
      teams: Team.all.as_json(only: [:id, :name, :points, :hunt_id])
    }
  end

  def find_by_hunt_id
    teams = Team.where(hunt_id: params[:hunt_id].to_i)
    begin
      render json: teams.as_json(only: [:id, :name, :points, :hunt_id])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def find_by_hunt_and_player
    #find all of the teams associated with the hunt id
    teams_by_hunt = Team.where(hunt_id: params[:hunt_id].to_i)
    #find all of the teamplayers with the player_id
    teamplayers = TeamPlayer.where(player_id: params[:player_id.to_i])

    #find all of the teams with the teamplayers
    team_ids = []
    teamplayers.each do |teamplayer|
      team_ids << teamplayer.team_id.to_i
    end

    teams_by_player = Team.where(id: team_ids)
    #cross-reference the teams from hunt_id with the teams from player_id via teamplayers and find the match
    team_id = 0
    teams_by_hunt.each do |team_by_hunt|
      teams_by_player.each do |team_by_player|
        if team_by_hunt.id == team_by_player.id
          team_id = team_by_hunt.id
        end
      end
    end

    #return the team
    team = Team.find(team_id.to_i)
    begin
      render json: team.as_json(only: [:id, :name, :points, :hunt_id])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def show
    begin
      render json: team.as_json(only: [:id, :name, :points, :hunt_id])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def update
    begin
      team.assign_attributes(team_params)

      if team.save
        render json: {id: team.id, name: team.name, points: team.points, hunt_id: team.hunt_id}
      else
        render status: :bad_request, json: {
          errors: team.errors.messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def destroy
    begin
      team.destroy
      render status: :no_content, content: false
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def create
    team = Team.new(team_params)
    if team.save
      render status: :created, json: {id: team.id, name: team.name, points: team.points, hunt_id: team.hunt_id}
    else
      render status: :bad_request, json: {
        errors: team.errors.messages
      }
    end
  end

private
  def team
    @team ||= Team.find(params[:id].to_i)
  end

  def team_params
    params.permit(:name, :points, :hunt_id)
  end

end
