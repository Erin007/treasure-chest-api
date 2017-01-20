class TeamPlayersController < ApplicationController

    skip_before_action :verify_authenticity_token

  def index
    render json: {
      count: TeamPlayer.count,
      teams: TeamPlayer.all.as_json(only: [:id, :player_id, :team_id])
    }
  end

  def show
    begin
      render json: teamplayer.as_json(only: [:id, :team_id, :player_id])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def update
    begin
      teamplayer.assign_attributes(teamplayer_params)

      if team.save
        render json: {id: teamplayer.id, team_id: teamplayer.team_id, player_id: team.player_id}
      else
        render status: :bad_request, json: {
          errors: teamplayer.errors.messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def destroy
    begin
      teamplayer.destroy
      render status: :no_content, content: false
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def create
    teamplayer = TeamPlayer.new(teamplayer_params)
    if teamplayer.save
      render status: :created, json: {id: teamplayer.id, team_id: teamplayer.team_id, player_id: teamplayer.player_id}
    else
      render status: :bad_request, json: {
        errors: teamplayer.errors.messages
      }
    end
  end

private
  def teamplayer
    @teamplayer ||= TeamPlayer.find(params[:id].to_i)
  end

  def teamplayer_params
    params.permit(:player_id, :team_id)
  end

end
