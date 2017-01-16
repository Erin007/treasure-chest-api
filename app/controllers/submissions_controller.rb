class SubmissionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: {
      count: Submission.count,
      submissions: Submission.all.as_json(only: [:id, :directive_id, :team_id, :photo, :caption, :status])
    }
  end

  # def new
  # end

  def show
    begin
      render json: submission.as_json(only: [:id, :directive_id, :team_id, :photo, :caption, :status])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def update
    begin
      submission.assign_attributes(submission_params)

      if submission.save
        render status: :no_content, content: false
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

  # def edit
  # end

  def create
    submission = Submission.new(submission_params)
    if submission.save
      render status: :created, json: {id: submission.id}
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
    params.permit(:directive_id, :team_id, :photo, :caption, :status)
  end

end
