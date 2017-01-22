class HuntsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: {
      count: Hunt.count,
      hunts: Hunt.all.as_json(only: [:id, :name, :description, :organizer_id, :passcode])
    }
  end

  def find_by_name
    hunts = Hunt.where(name: params[:name])
    begin
      render json: hunts.as_json(only: [:id, :name, :description, :organizer_id, :passcode])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def find_by_organizer
    hunts = Hunt.where(organizer_id: params[:organizer_id])
    begin
      render json: hunts.as_json(only: [:id, :name, :description, :organizer_id, :passcode])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def find_by_player
    # find the teamplayers that the player is part of
    teamplayers = TeamPlayer.where(player_id: params[:player_id].to_i)
    # use the teamplayers to find the teams that the player is part of
    team_ids = []

    teamplayers.each do |teamplayer|
      team_ids << teamplayer.team_id.to_i
    end

    teams = Team.where(id: team_ids)

    #use the hunt_id of the teams to the find the hunts the player is part of
    hunt_ids = []

    teams.each do |team|
      hunt_ids << team.hunt_id.to_i 
    end

    hunts = Hunt.where(id: hunt_ids)
    begin
      render json: hunts.as_json(only: [:id, :name, :description, :organizer_id, :passcode])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def show
    hunt = Hunt.find(params[:id])
    begin
      render json: hunt.as_json(only: [:id, :name, :description, :organizer_id, :passcode])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def update
    begin
      hunt.assign_attributes(hunt_params)

      if hunt.save
        render json: {id: hunt.id, name: hunt.name, organizer_id: hunt.organizer_id, passcode: hunt.passcode, description: hunt.description}
      else
        render status: :bad_request, json: {
          errors: hunt.errors.messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def destroy
    begin
      hunt.destroy
      render status: :no_content, content: false
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  #def find_by_name

  # def edit
  # end

  def create
    puts "We're in the create method!"
    hunt2 = Hunt.new(hunt_params)

    if hunt2.save
      puts hunt2.inspect
      puts hunt2.errors.messages

      render status: :created, json: {id: hunt2.id, name: hunt2.name, passcode: hunt2.passcode, description: hunt2.description, organizer_id: hunt2.organizer_id}
    else
      render status: :bad_request, json: {
        errors: hunt2.errors.messages
      }
    end


  end

private
  # def hunt
  #  @hunt ||= Hunt.find(params[:id].to_i)
  # end

  def hunt_params
    params.permit(:description, :passcode, :name, :organizer_id)
  end

protected


end
