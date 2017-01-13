class HuntsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: {
      count: Hunt.count,
      hunts: Hunt.all.as_json(only: [:id, :name, :description, :organizer_id, :passcode])
    }
  end

  # def new
  # end

  def show
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
        render status: :no_content, content: false
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

  # def edit
  # end

  def create
    hunt = Hunt.new(hunt_params)
    if hunt.save
      render status: :created, json: {id: hunt.id, name: hunt.name, passcode: hunt.passcode, description: hunt.description, organizer_id: hunt.organizer_id}
    else
      render status: :bad_request, json: {
        errors: hunt.errors.messages
      }
    end
  end

private
  def hunt
   @hunt ||= Hunt.find(params[:id].to_i)
  end

  def hunt_params
    params.permit(:description, :passcode, :name, :organizer_id)
  end

protected


end
