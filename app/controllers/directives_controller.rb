class DirectivesController < ApplicationController
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
  def directive_params
    params.require(:directive).permit(:decription, :complete?, :point_value, :name, :hunt_id)
  end

end
