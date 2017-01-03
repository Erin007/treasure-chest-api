class HuntsController < ApplicationController
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
  def hunt_params
    params.require(:hunt).permit(:decription, :passcode, :name, :organizer_id)
  end

end
