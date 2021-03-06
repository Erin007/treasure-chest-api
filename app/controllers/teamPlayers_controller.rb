class TeamplayersController < ApplicationController

    #skip_before_action :verify_authenticity_token

    protect_from_forgery except: :create

  def index
    render json: {
      count: TeamPlayer.count,
      teamplayers: TeamPlayer.all.as_json(only: [:id, :player_id, :team_id])
    }
  end

  def show
    begin
      render json: teamplayer.as_json(only: [:id, :team_id, :player_id])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def find
    teamplayer = 0

    teamplayers_by_player = TeamPlayer.where(player_id: params[:player_id])

    teamplayers_by_team = TeamPlayer.where(team_id: params[:team_id])

    teamplayers_by_team.each do |tp_by_team|
      teamplayers_by_player.each do |tp_by_player|
        if tp_by_player == tp_by_team
          teamplayer = tp_by_player
        end
      end
    end

    begin
      render json: teamplayer.as_json(only: [:id, :player_id, :team_id])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end

  end

  def update
    begin
      teamplayer.assign_attributes(teamplayer_params)

      if teamplayer.save
        render json: {id: teamplayer.id, team_id: teamplayer.team_id, player_id: teamplayer.player_id}
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
