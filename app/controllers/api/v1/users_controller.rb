class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :index]

  def index
    # Fetch and return a list of resources
    users = User.all
    render json: users
  end

  def show
    # Fetch and return a single resource
    user = User.find(params[:id])
    render json: user
  end

  def create
    # Create a new resource
    user = User.new(user_params)
    if user.save
      render json: user, status: 200
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    # Update an existing resource
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    # Delete a resource
    user = User.find(params[:id])
    user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar_url, :username)
  end

end
