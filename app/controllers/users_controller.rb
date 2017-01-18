class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: {
      count: User.count,
      teams: User.all.as_json(only: [:id, :username, :email, :firebase])
    }
  end

  def show
    begin
      render json: user.as_json(only: [:id, :username, :email, :firebase])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def find
    users = User.where(firebase: params[:firebase].to_s)
    begin
      render json: users.as_json(only: [:id, :username, :email, :firebase])
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render status: :created, json: {id: user.id, username: team.username, email: user.email, firebase: user.firebase }
    else
      render status: :bad_request, json: {
        errors: user.errors.messages
      }
    end
  end

  def destroy
    begin
      user.destroy
      render status: :no_content, content: false
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  def update
    begin
      user.assign_attributes(user_params)

      if user.save
        render status: :no_content, content: false
      else
        render status: :bad_request, json: {
          errors: user.errors.messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      render status: :not_found, content: false
    end
  end

  # def edit
  # end
private
  def user
    @user||= User.find(params[:id].to_i)
  end

  def user_params
    params.permit(:username, :email, :firebase)
  end

end
