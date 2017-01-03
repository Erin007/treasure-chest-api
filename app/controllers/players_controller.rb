class PlayersController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def create
  end

private
  def player_params
    params.require(:player).permit(:username)
  end

end
