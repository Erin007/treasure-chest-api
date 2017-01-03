class OrganizersController < ApplicationController
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
  def organizer_params
    params.require(:organizer).permit(:username)
  end

end
