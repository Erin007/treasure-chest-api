class DirectivesController < ApplicationController

  def index
    #is it better to only show the directives for a specific hunt?
    render json: {
       directives: Directive.all.as_json(only: [:id, :description, :complete, :point_value, :name, :hunt_id])
    }
  end

  # def new
  # end

  def show
    begin
      render json: directive.as_json(only: [:id, :description, :complete, :point_value, :name, :hunt_id])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def update
    begin
      directive.assign_attributes(directive_params)

      if directive.save
        render status: :no_content, content: false
      else
        render status: :bad_request, json: {
          errors: directive.errors.messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def destroy
    begin
      directive.destroy
      render status: :no_content, content: false
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  # def edit
  # end

  def create
    directive = Directive.new(directive_params)
    if directive.save
      render status: :created, json: {id: directive.id}
    else
      render status: :bad_request, json: {
        errors: directive.errors.messages
      }
    end
  end

private

  def directive
   @directive ||= Directive.find(params[:id].to_i)
  end

  def directive_params
    params.permit(:description, :complete, :point_value, :name, :hunt_id)
  end

end
