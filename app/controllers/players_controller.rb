class PlayersController < ApplicationController
  def index
    render json: {
      count: Player.count,
      players: Player.all.as_json(only: [:id, :username])
    }
  end

  # def new
  # end

  def show
    begin
      render json: player.as_json(only: [:id, :username])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def update
    begin
      player.assign_attributes(organizer_params)

      if player.save
        render status: :no_content, content: false
      else
        render status: :bad_request, json: {
          errors: player.errors.messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def destroy
    begin
      player.destroy
      render status: :no_content, content: false
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  # def edit
  # end

  def create
    player = Player.new(player_params)
    if player.save
      render status: :created, json: {id: player.id}
    else
      render status: :bad_request, json: {
        errors: player.errors.messages
      }
    end
  end

private
  def player
    @player ||= Player.find(params[:id].to_i)
  end

  def player_params
    params.require(:player).permit(:username)
  end

end
