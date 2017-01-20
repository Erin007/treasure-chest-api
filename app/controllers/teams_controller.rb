class TeamsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: {
      count: Team.count,
      teams: Team.all.as_json(only: [:id, :name, :points, :hunt_id])
    }
  end

  def find
    teams = Team.where(hunt_id: params[:hunt_id])
    begin
      render json: teams.as_json(only: [:id, :name, :points, :hunt_id])
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
