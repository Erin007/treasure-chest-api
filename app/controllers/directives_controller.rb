class DirectivesController < ApplicationController

  #skip_before_action :verify_authenticity_token
  #skip_before_action :verify_authenticity_token, if: :json_request?

  protect_from_forgery except: :create

  def index
    render json: {
       directives: Directive.all.as_json(only: [:id, :description, :complete, :point_value, :name, :hunt_id])
    }
  end

  def find
    directives = Directive.where(hunt_id: params[:hunt_id])
    begin
      render json:
         directives.as_json(only: [:id, :name, :description, :complete, :point_value, :hunt_id])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

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
        render json: {id: directive.id, description: directive.description, complete:  directive.complete, point_value: directive.point_value, name: directive.name,
        hunt_id: directive.hunt_id}
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

  def create
    directive2 = Directive.new(directive_params)
    if directive2.save
      puts directive2.inspect
      puts directive2.errors.messages

      render status: :created, json: {id: directive2.id, name: directive2.name, complete: directive2.complete, description: directive2.description, point_value: directive2.point_value, hunt_id: directive2.hunt_id}
    else
      render status: :bad_request, json: {
        errors: directive2.errors.messages
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

protected

  def json_request?
    return request.format.json?
  end

end
