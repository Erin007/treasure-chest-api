class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: {
      count: User.count,
      teams: User.all.as_json(only: [:id, :username, :email, :firebase, :location, :bio, :photo])
    }
  end

  def show
    begin
      render json: user.as_json(only: [:id, :username, :email, :firebase, :location, :bio, :photo])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def find_by_firebase
    users = User.where(firebase: params[:firebase].to_s)
    begin
      render json: users.as_json(only: [:id, :username, :email, :firebase, :location, :bio, :photo])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def find_by_team
    # find all of the teamplayers associated with the team
    teamplayers = TeamPlayer.where(team_id: params[:team_id].to_i)

    #find all of the players associated with those teamplayers
    player_ids = []

    teamplayers.each do |teamplayer|
      player_ids << teamplayer.player_id
    end

    players = User.where(id: player_ids)
    begin
      render json: players.as_json(only: [:id, :username, :email, :firebase, :location, :bio, :photo])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render status: :created, json: {id: user.id, username: user.username, email: user.email, firebase: user.firebase, location: user.location, bio: user.bio, photo: user.photo }
    else
      render status: :bad_request, json: {
        errors: user.errors.messages
      }
    end
  end

  def destroy
    begin
      user.destroy
      render status: :no_content, content: false
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def update
    begin
      user.assign_attributes(user_params)

      if user.save
        render json: {id: user.id, username: user.username, email: user.email, firebase: user.firebase, location: user.location, bio: user.bio, photo: user.photo }
      else
        render status: :bad_request, json: {
          errors: user.errors.messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

private
  def user
    @user||= User.find(params[:id].to_i)
  end

  def user_params
    params.permit(:username, :email, :firebase, :location, :bio, :photo)
  end

end
