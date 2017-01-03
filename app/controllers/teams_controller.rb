class TeamsController < ApplicationController
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
  def team_params
    params.require(:team).permit(:name, :points)
  end

end
