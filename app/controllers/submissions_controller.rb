class SubmissionsController < ApplicationController
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
  def submission_params
    params.require(:submission).permit(:directive_id, :team_id, :photo, :caption, :status)
  end

end
