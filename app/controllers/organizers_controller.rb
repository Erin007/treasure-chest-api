class OrganizersController < ApplicationController
  def index
    render json: {
      count: Organizer.count,
      organizers: Organizer.all.as_json(only: [:id, :username])
    }
  end

  # def new
  # end

  def show
    begin
      render json: organizer.as_json(only: [:id, :username])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def update
    begin
      organizer.assign_attributes(organizer_params)

      if organizer.save
        render status: :no_content, content: false
      else
        render status: :bad_request, json: {
          errors: organizer.errors.messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def destroy
    begin
      organizer.destroy
      render status: :no_content, content: false
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  # def edit
  # end

  def create
    organizer = Organizer.new(organizer_params)
    if organizer.save
      render status: :created, json: {id: organizer.id}
    else
      render status: :bad_request, json: {
        errors: organizer.errors.messages
      }
    end
  end

private
  def organizer
    @organizer ||= Organizer.find(params[:id].to_i)
  end

  def organizer_params
    params.require(:organizer).permit(:username)
  end

end
