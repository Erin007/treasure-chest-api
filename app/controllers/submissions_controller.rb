class SubmissionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: {
      count: Submission.count,
      submissions: Submission.all.as_json(only: [:id, :directive_id, :team_id, :photo, :caption, :status, :directive_name])
    }
  end

  def show
    begin
      render json: submission.as_json(only: [:id, :directive_id, :team_id, :photo, :caption, :status, :directive_name])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def find_by_team_and_directive
    submission = Submission.where(team_id: params[:team_id].to_i, directive_id: params[:directive_id].to_i)

    begin
      render json: submission[0].as_json(only: [:id, :directive_id, :team_id, :photo, :caption, :status, :directive_name])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def find_by_hunt
    #find all of the directives associated with this hunt
    directives = Directive.where(hunt_id: params[:hunt_id].to_i)

    #store all of the ids from those directives
    directive_ids =[]

    directives.each do |d|
      directive_ids << d.id.to_i
    end

    #use those ids to find any submission that is associated with this hunt
    submissions = Submission.where(directive_id: directive_ids)

    begin
      render json: submissions.as_json(only: [:id, :directive_id, :team_id, :photo, :caption, :status, :directive_name])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end

  end

  def update
    begin
      submission.assign_attributes(submission_params)

      if submission.save
        render json: {id: submission.id, directive_id: submission.directive_id, team_id: submission.team_id, photo: submission.photo, caption: submission.caption, status: submission.status, directive_name: submission.directive_name}
      else
        render status: :bad_request, json: {
          errors: submission.errors.messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def destroy
    begin
      submission.destroy
      render status: :no_content, content: false
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def create
    submission = Submission.new(submission_params)
    if submission.save
      render status: :created, json: {id: submission.id, directive_id: submission.directive_id, team_id: submission.team_id, photo: submission.photo, caption: submission.caption, status: submission.status, directive_name: submission.directive_name }
    else
      render status: :bad_request, json: {
        errors: submission.errors.messages
      }
    end
  end

private
  def submission
    @submission ||= Submission.find(params[:id].to_i)
  end

  def submission_params
    params.permit(:directive_id, :team_id, :photo, :caption, :status, :directive_name)
  end

end
